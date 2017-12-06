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

namespace LibraryNotes.Forms.MainWindows.Search
{
    /// <summary>
    /// Логика взаимодействия для SearchControl.xaml
    /// </summary>
    public partial class SearchControl : UserControl
    {
        private int id;
        public SearchControl(int id)
        {
            this.id = id;
            InitializeComponent();
            Content_similar_book.Content = new SimilarBooks(id);
            Content_authors.Content = new ByAuthors(id);
            Content_genres.Content = new ByGenres(id);
        }
    }
}
