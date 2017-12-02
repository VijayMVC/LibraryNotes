using LibraryNotes.Models;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для UserInformation.xaml
    /// </summary>
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
        }

        private void Save(object sender, RoutedEventArgs e)
        {

        }
    }
}
