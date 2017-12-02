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
    public partial class UserInformation : UserControl
    {
        User user;
        public UserInformation(User user)
        {
            this.user = user;
            InitializeComponent();
            TextBoxName.Text = user.Name;
            TextBoxAddress.Text = user.Adress;
            TextBoxPhoneNumber.Text = user.Phonenunmber;
            TextBoxSex.Text = user.Sex;
            LabelLogin.Content = user.Login;
            TextBoxSex.Text = user.Sex;
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            User updUser = getUpdateinfo();
            if (updUser!=null)
            {
                using (SqlConnection conn = new SqlConnection(Metadata.ConnectionString.defaultString))
                {
                    using (SqlCommand cmd = new SqlCommand("UsersUpdate", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@Id", updUser.Id);
                        cmd.Parameters.AddWithValue("@Password", updUser.Password);
                        cmd.Parameters.AddWithValue("@Name", updUser.Name);
                        cmd.Parameters.AddWithValue("@Address", updUser.Adress);
                        cmd.Parameters.AddWithValue("@Sex", updUser.Sex);
                        cmd.Parameters.AddWithValue("@PhoneNumber", updUser.Phonenunmber);
                        cmd.Parameters.AddWithValue("@Admin", updUser.Admin);
                        //AHAHAHAHAHAH 4TO ETO ZA MYASO?????
                        try
                        {
                            cmd.ExecuteNonQuery();
                            MessageBox.Show("ok");
                        }
                        catch (Exception ee)
                        {
                            UserInfoError.Text = ee.Message;
                        }
                    }

                }
                UserInfoError.Text = "";
                PasswordBoxPassword.Password = "";
                PasswordBoxPasswordConfirm.Password = "";

            }


        }

        private User getUpdateinfo()
        {
            User updUser = new User();
            updUser.Id = user.Id;
            updUser.Login = user.Login;
            updUser.Admin = user.Admin;

            updUser.Sex = TextBoxSex.Text;
            updUser.Name = TextBoxName.Text;
            updUser.Adress = TextBoxAddress.Text;
            updUser.Phonenunmber = TextBoxPhoneNumber.Text;
            if (PasswordBoxPassword.Password == "" && PasswordBoxPasswordConfirm.Password == "")
                updUser.Password = user.Password;
            else if (PasswordBoxPasswordConfirm.Password == PasswordBoxPassword.Password)
                updUser.Password = PasswordBoxPassword.Password;
            else
            {
                UserInfoError.Text = "Passwords do not match";
                return null;
            }
            return updUser;
        }
    }
}
