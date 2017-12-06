using LibraryNotes.Forms.MainWindows;
using LibraryNotes.Forms.MainWindows.Search;
using LibraryNotes.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
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

namespace LibraryNotes.Forms
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        private User user;
        public Main(User user)
        {
            this.user = user;
            if (this.user.Role == Metadata.AuthRoles.ADMIN)
                Metadata.CurrentConnectionString = Metadata.ConnectionString.admin;
            else
                Metadata.CurrentConnectionString = Metadata.ConnectionString.user;
            Metadata.CurrentUserId = user.Id;
            InitializeComponent();
            if(user.Role != Metadata.AuthRoles.ADMIN)
            AdminPanel.Visibility = Visibility.Hidden;
            TabItem_UserInfo.Content = new UserInformation(this.user);
            DataGridBooksWrap.Content = new Books();
            TabItem_UserOrders.Content = new UserOrders(this.user.Id);
            BookSearch.Content = new SearchControl(this.user.Id);
        }

        private void Logout_ButtonCLick(object sender, RoutedEventArgs e)
        {
            new Login().Show();
            Metadata.CurrentConnectionString = Metadata.ConnectionString.defaultString;
            Close();
        }
    }
}
