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

namespace LibraryNotes.Forms.MainWindows.Admin
{
    /// <summary>
    /// Логика взаимодействия для Orders.xaml
    /// </summary>
    public partial class Orders : UserControl
    {
        List<Order> orders;
        public Orders()
        {
            InitializeComponent();
        }

        private void ShowHideDetails(object sender, RoutedEventArgs e)
        {
            if (datagrid_user_orders.SelectedItem == null) return;
            Order order = datagrid_user_orders.SelectedItem as Order;

            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("updateOrderWithReturnBook", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@OrderId", order.id);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            ComboBox_SelectionChanged(null, null);
                        };
                    }
                }
            }
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                string selectProc = "";
                string sel = ((ComboBoxItem)ComboboxOrdersType.SelectedValue).Content.ToString();

                if (sel == "Active")
                    selectProc = "selectActiveOrders";
                else if (sel == "Overdue")
                    selectProc = "selectOverdueOrders";
                else
                    selectProc = "OrdersSelectAll";

                using (SqlCommand cmd = new SqlCommand(selectProc, conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    orders = new List<Order>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Order order = new Order();
                            order.id = int.Parse(reader["Id"].ToString());
                            order.Order_date = (DateTime)reader["Order_date"];
                            order.Required_date = (DateTime)reader["Required_date"];
                            order.Return_date = reader["Return_date"] as DateTime? ?? null;

                            orders.Add(order);
                        };
                    }
                    datagrid_user_orders.ItemsSource = orders;
                }
            }
        }

    }
}
