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
    /// Логика взаимодействия для Books.xaml
    /// </summary>
    public partial class Books : UserControl
    {
        public class BooksInfo {
            public Book book { get; set; }
            public Author author { get; set; }
            public BooksInfo() {
                book = new Book();
                author = new Author();
            }
        } 
        public Books()
        {
            InitializeComponent();
        }

        private void OnLoad(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("selectAuthorsAndBooks", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    List<BooksInfo> Books = new List<BooksInfo>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            BooksInfo book = new BooksInfo();
                            book.book.Id = int.Parse(reader["Id"].ToString());
                            book.book.Name = reader["Name"].ToString();
                            book.book.Year = int.Parse(reader["Year"].ToString());
                            book.book.Description = reader["Description"].ToString();
                            book.author.First_Name = reader["First_Name"].ToString() + reader["Last_Name"].ToString();

                            Books.Add(book);
                        };
                    }
                    datagrid_books.ItemsSource = Books;
                    conn.Close();
                }
            }
        }

        private void datagrid_books_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (datagrid_books.SelectedItem == null) return;
            BooksInfo dr = datagrid_books.SelectedItem as BooksInfo;
            new BookOrderInfo(dr.book.Id).Show();
        }
    }
}
