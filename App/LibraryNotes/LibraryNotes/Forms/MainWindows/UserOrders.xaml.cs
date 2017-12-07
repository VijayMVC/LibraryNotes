using LibraryNotes.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LibraryNotes.Forms.MainWindows
{
    /// <summary>
    /// Логика взаимодействия для UserOrders.xaml
    /// </summary>
    public partial class UserOrders : UserControl
    {
        public class BooksInfo
        {
            public string book { get; set; }
            public Order order { get; set; }
            public BooksInfo()
            {
                order = new Order();
            }
        }
        private int id;
        public UserOrders(int id)
        {
            this.id = id;
            InitializeComponent();
        }

        private void OnLoad(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("selectUserOrders", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@Id", this.id);
                    List<BooksInfo> Books = new List<BooksInfo>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            BooksInfo book = new BooksInfo();
                            book.order.id = int.Parse(reader["Id"].ToString());
                            book.order.Order_date = (DateTime)reader["Order_date"];
                            book.order.Required_date = (DateTime)reader["Required_date"];
                            book.order.Return_date = reader["Return_date"] as DateTime? ?? null;
                            book.book = reader["Name"].ToString();

                            Books.Add(book);
                        };
                    }
                    datagrid_user_orders.ItemsSource = Books;
                    conn.Close();
                }
            }
        }

        private void click_returnBook(object sender, RoutedEventArgs e)
        {
            var selectOrder = (BooksInfo)datagrid_user_orders.SelectedItem;
            if (selectOrder.order.Return_date == null)
                using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("updateOrderWithReturnBook", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@OrderId", selectOrder.order.id);
                        List<BooksInfo> Books = new List<BooksInfo>();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                OnLoad(null, null);
                            };
                        }
                    }
                }
        }
    }
}
