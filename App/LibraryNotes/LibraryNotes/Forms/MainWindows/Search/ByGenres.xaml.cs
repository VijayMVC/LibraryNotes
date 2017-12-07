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
    /// Логика взаимодействия для ByGenres.xaml
    /// </summary>
    public partial class ByGenres : UserControl
    {
        int id;
        List<Genre> genres;

        public ByGenres(int id)
        {
            InitializeComponent();
        }

        private void datagrid_books_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (datagrid_books.SelectedItem == null) return;
            Book dr = datagrid_books.SelectedItem as Book;
            new BookOrderInfo(dr.Id).Show();
        }

        private void OnLoad(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("selectTopPopularGenres", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    genres = new List<Genre>();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Genre genre = new Genre();
                            genre.Id = int.Parse(reader["Id"].ToString());
                            genre.Name = reader["Rating"].ToString() + "             " +  reader["Genre"].ToString();

                            genres.Add(genre);
                        };
                    }
                    ListBoxGenres1.ItemsSource = genres;
                    conn.Close();
                }
            }
        }

        private void ButtonGenreAdd_Click(object sender, RoutedEventArgs e)
        {
            if (ListBoxGenres1.SelectedItem == null) return;
            if (ListBoxGenres2.Items.Count > 2)
            {
                error.Text = "Max 3 genres!";
                return;
            }
            Genre dr = ListBoxGenres1.SelectedItem as Genre;
            ListBoxGenres2.Items.Add(dr);
            ListBoxGenres2.Items.Refresh();
        }

        private void ButtonGenreDelete_Click(object sender, RoutedEventArgs e)
        {
            if (ListBoxGenres2.SelectedItem == null) return;
            error.Text = "";
            Genre dr = ListBoxGenres2.SelectedItem as Genre;
            ListBoxGenres2.Items.Remove(dr);
            ListBoxGenres2.Items.Refresh();
        }

        private void ButtonGenreFind_Click(object sender, RoutedEventArgs e)
        {
            error.Text = "";
            if (ListBoxGenres2.Items.Count == 0)
            {
                error.Text = "Select any genre!";
                return;
            }

            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("selectSimilarBooksByGenres", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    List<Book> Books = new List<Book>();
                    List<Genre> genres = ListBoxGenres2.Items.Cast<Genre>().ToList();
                    for (int i = 0; i < genres.Count; i++) {
                        cmd.Parameters.AddWithValue($"@genre{i+1}", genres[i].Name);
                    }

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
