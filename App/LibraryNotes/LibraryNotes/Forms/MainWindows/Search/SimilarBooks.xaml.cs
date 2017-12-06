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

namespace LibraryNotes.Forms.MainWindows.Search
{
    /// <summary>
    /// Логика взаимодействия для SimilarBooks.xaml
    /// </summary>
    public partial class SimilarBooks : UserControl
    {
        int id;
        List<Book> Books;
        public SimilarBooks(int _id)
        {
            id = _id;
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
                    Books =  new List<Book>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Book book = new Book();
                            book.Id = int.Parse(reader["Id"].ToString());
                            book.Name = reader["Name"].ToString();

                            Books.Add(book);
                        };
                    }
                    combobox_books.ItemsSource = Books;
                    conn.Close();
                }
            }
        }

        private void datagrid_books_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (datagrid_books.SelectedItem == null) return;
            Book dr = datagrid_books.SelectedItem as Book;
            new BookOrderInfo(dr.Id).Show();
        }


        private void combobox_books_SelectionChanged(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("selectSimilarBooks", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    int limit = 5;
                    if (Limmit.Text.Length != 0)
                        int.TryParse(Limmit.Text, out limit);

                    List<Book> Books = new List<Book>();
                    string selI;
                    if (combobox_books.SelectedItem == null)
                    {
                        selI = Books[0].Name;
                    }
                    else
                        selI = ((Book)combobox_books.SelectedItem).Name;            //AHAHHAHA KOSTILI POEHALI
                    cmd.Parameters.AddWithValue("@Book", selI);
                    cmd.Parameters.AddWithValue("@Top", limit);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Book book = new Book();
                            book.Id = int.Parse(reader["Id"].ToString());
                            book.Name = reader["Name"].ToString();

                            Books.Add(book);
                        };
                    }
                    datagrid_books.ItemsSource = Books;
                }
            }
        }
    }
}
