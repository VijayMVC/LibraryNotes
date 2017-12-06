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
    public partial class ByAuthors : UserControl
    {
        int id;
        List<Author> authors;
        public ByAuthors(int _id)
        {
            id = _id;
            InitializeComponent();
        }

        private void OnLoad(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AuthorsSelectAll", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    authors = new List<Author>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Author author = new Author();
                            author.Id = int.Parse(reader["Id"].ToString());
                            author.First_Name = reader["First_Name"].ToString();
                            author.Last_Name = reader["Last_Name"].ToString();

                            authors.Add(author);
                        };
                    }
                    combobox_books.ItemsSource = authors;
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
                using (SqlCommand cmd = new SqlCommand("selectBooksByAuthors", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    List<Book> Books = new List<Book>();
                    Author selI;
                    if (combobox_books.SelectedItem == null)
                    {
                        selI = authors[0];
                    }
                    else
                        selI = ((Author)combobox_books.SelectedItem);            //AHAHHAHA KOSTILI POEHALI
                    cmd.Parameters.AddWithValue("@First", selI.First_Name);
                    cmd.Parameters.AddWithValue("@Last", selI.Last_Name);

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
