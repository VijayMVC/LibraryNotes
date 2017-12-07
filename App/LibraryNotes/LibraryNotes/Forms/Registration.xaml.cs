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
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        public Registration()
        {
            InitializeComponent();
            textBoxLogin.Focus();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            Login login = new Login();
            login.Show();
            Close();
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            Reset();
        }

        public void Reset()
        {
            textBlockLogin.Text = "";
            textBoxLogin.Text = "";
            textBoxAddress.Text = "";
            passwordBox1.Password = "";
            passwordBoxConfirm.Password = "";
        }
        private void button3_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Submit_Click(object sender, RoutedEventArgs e)
        {

            if (textBoxLogin.Text.Length == 0)
            {
                errormessage.Text = "Enter an email.";
                textBoxLogin.Focus();
            }
            else
            {
      

                if (passwordBox1.Password.Length == 0)
                {
                    errormessage.Text = "Enter password.";
                    passwordBox1.Focus();
                }
                else if (passwordBoxConfirm.Password.Length == 0)
                {
                    errormessage.Text = "Enter Confirm password.";
                    passwordBoxConfirm.Focus();
                }
                else if (passwordBox1.Password != passwordBoxConfirm.Password)
                {
                    errormessage.Text = "Confirm password must be same as password.";
                    passwordBoxConfirm.Focus();
                }
                else
                {
                    using (SqlConnection conn = new SqlConnection(Metadata.ConnectionString.defaultString))
                    {
                        using (SqlCommand cmd = new SqlCommand("UsersInsert", conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        })
                        {
                            conn.Open();
                            cmd.Parameters.AddWithValue("@Login", textBoxLogin.Text);
                            cmd.Parameters.AddWithValue("@Password", passwordBox1.Password);
                            cmd.Parameters.AddWithValue("@Name", textBoxName.Text);
                            cmd.Parameters.AddWithValue("@Address", textBoxAddress.Text);
                            cmd.Parameters.AddWithValue("@Sex", comboBoxSex.Text);
                            cmd.Parameters.AddWithValue("@PhoneNumber", textBoxNumber.Text);
                            cmd.Parameters.AddWithValue("@Admin", 1);

                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read()) {
                                    MessageBox.Show("Ok");
                                    Login login = new Login();
                                    login.Show();
                                    Close();
                                }
                                reader.Close();
                            }
                        }

                    }
                }
                Reset();
            }
        }
    }
}

