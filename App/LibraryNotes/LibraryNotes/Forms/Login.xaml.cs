using LibraryNotes.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LibraryNotes.Forms
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxLogin.Text.Length == 0)
            {
                errormessage.Text = "Enter an Login.";
                textBoxLogin.Focus();
            }
            else if (passwordBox1.Password.Length == 0)
            {
                errormessage.Text = "Enter an Login.";
                passwordBox1.Focus();
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(Metadata.ConnectionString.defaultString))
                {
                    using (SqlCommand cmd = new SqlCommand("selectUserExist", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@Login", textBoxLogin.Text);
                        cmd.Parameters.AddWithValue("@Password", passwordBox1.Password);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                User user = new User();
                                user.Adress = reader["Address"].ToString();
                                user.Login = reader["Login"].ToString();
                                user.Password = reader["Login"].ToString();
                                user.Name = reader["Name"].ToString();
                                user.Sex = reader["Sex"].ToString();
                                user.Id = int.Parse(reader["Id"].ToString());
                                user.Phonenunmber = reader["PhoneNumber"].ToString();
                                user.Admin = int.Parse(reader["Admin"].ToString()) == (int)Metadata.AuthRoles.ADMIN ?
                                    Metadata.AuthRoles.ADMIN : Metadata.AuthRoles.USER;         //охи сцаки, охи сцаки, это ж еще такое написать надо
                                new Main(user).Show();
                                Close();
                            }
                            else
                            {
                                errormessage.Text = "Incorrect login or password";
                            }
                        }
                        conn.Close();
                    }
                }

            }
        }

        private void buttonRegister_Click(object sender, RoutedEventArgs e)
        {
            new Registration().Show();
            Close();
        }


    }
}
