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
using System.Windows.Shapes;

namespace LibraryNotes.Forms.MainWindows
{
    /// <summary>
    /// Логика взаимодействия для BookOrderInfo.xaml
    /// </summary>
    public partial class BookOrderInfo : Window
    {

        public class BooksInfo
        {
            public Book book { get; set; }
            public Author author { get; set; }

            public List<string> genres { get; set; }
            public List<string> tags { get; set; }
            public BooksInfo()
            {
                book = new Book();
                author = new Author();
                genres = new List<string>();
                tags = new List<string>();
            }
        }
        BooksInfo book = new BooksInfo();

        int id;
        public BookOrderInfo(int id)
        {
            this.id = id;
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {

                using (SqlCommand cmd0 = new SqlCommand("selectAuthorsAndBooksId", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                using (SqlCommand cmd = new SqlCommand("selectGenresByBook", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                using (SqlCommand cmd1 = new SqlCommand("selectTagsByBook", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {

                    conn.Open();
                    cmd0.Parameters.AddWithValue("@Id", this.id);

                    using (SqlDataReader reader = cmd0.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            book.book.Id = int.Parse(reader["Id"].ToString());
                            book.book.Name = reader["Name"].ToString();
                            book.book.Year = int.Parse(reader["Year"].ToString());
                            book.book.Description = reader["Description"].ToString();
                            book.author.First_Name = reader["First_Name"].ToString() + reader["Last_Name"].ToString();
                        };
                    }

                    cmd.Parameters.AddWithValue("@Book", book.book.Name);
                    cmd1.Parameters.AddWithValue("@Book", book.book.Name);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            book.genres.Add(reader["Genre"].ToString());
                        };
                    }
                    using (SqlDataReader reader = cmd1.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            book.tags.Add(reader["name"].ToString());
                        };
                    }
                }
            }
            //ETO NE MOY KOD, YA TAK NE PISHU, BAZARY
            TextBoxAuthor.Text = book.author.First_Name;
            TextBoxName.Text = book.book.Name;
            TextBoxDescription.Text = book.book.Description;
            TextBoxYear.Text = book.book.Year.ToString();
            TextBoxGenres.Text = String.Join(", ", book.genres.ToArray());
            TextBoxTags.Text = String.Join(", ", book.tags.ToArray());
        }
        private void DoOrder_Click(object sender, RoutedEventArgs e)
        {
            if (calendar1.SelectedDate == null)
                error.Text = "Select the return date!";
            else
                using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
                {

                    using (SqlCommand cmd1 = new SqlCommand("OrdersInsert", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        conn.Open();

                        cmd1.Parameters.AddWithValue("@Book_Id", book.book.Id);
                        cmd1.Parameters.AddWithValue("@User_Id", Metadata.CurrentUserId);
                        cmd1.Parameters.AddWithValue("@Order_date", DateTime.Now.ToString("yyyy-MM-dd"));

                        DateTime date = calendar1.SelectedDate.Value;

                        cmd1.Parameters.AddWithValue("@Required_date", date);
                        cmd1.Parameters.AddWithValue("@Return_date", null);
                        using (SqlDataReader reader = cmd1.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                MessageBox.Show("The book was ordered with order number: " + reader["Id"].ToString());
                            };
                        }
                    }
                }
        }
    }
}
