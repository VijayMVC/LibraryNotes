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
using System.Windows.Shapes;

namespace LibraryNotes.Forms
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        public Main()
        {
            InitializeComponent();
        }

        public bool bConnected
        {
            get { return Metadata.CurrentAppRole; }
            set { SetValue(bConnectedProperty, value); }
        }

        //TODO доделай биндинг свойства админ/юзер для активности кнопок
        public static readonly DependencyProperty bConnectedProperty =
            DependencyProperty.Register("bConnected", typeof(bool), typeof(Main), new PropertyMetadata(false));
    }
}
