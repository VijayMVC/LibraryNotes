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
        Registration registration = new Registration();
        Main mainWindow = new Main();

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

                        var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                        returnParameter.Direction = ParameterDirection.ReturnValue;

                        cmd.ExecuteNonQuery();
                        var result = int.Parse(returnParameter.Value.ToString());
                        Main main = new Main();

                        switch (result)
                        {
                            case (int)Metadata.AuthRoles.ADMIN:
                                Metadata.CurrentAppRole = true;
                                Metadata.CurrentConnectionString = Metadata.ConnectionString.admin;
                                main.Show();
                                Close();
                                break;
                            case (int)Metadata.AuthRoles.USER:
                                Metadata.CurrentAppRole = false;
                                Metadata.CurrentConnectionString = Metadata.ConnectionString.user;
                                main.Show();
                                Close();
                                break;
                            case (int)Metadata.AuthRoles.ANON:
                                errormessage.Text = "Incorrect login or password";
                                break;
                            default: break;
                        }
                    }

                }

            }
        }

        private void buttonRegister_Click(object sender, RoutedEventArgs e)
        {
            registration.Show();
            Close();
        }


    }
}
