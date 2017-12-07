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

namespace LibraryNotes.Forms.MainWindows.Admin
{
    /// <summary>
    /// Логика взаимодействия для XML.xaml
    /// </summary>
    public partial class XML : UserControl
    {
        public event EventHandler<EventArgs> FileNameChanged;

        public string FileName
        {
            get { return FBCTextBox.Text; }
            set { FBCTextBox.Text = value; }
        }
        public XML()
        {
            InitializeComponent();
        }

        private void FBCTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            e.Handled = true;
            FileNameChanged?.Invoke(this, EventArgs.Empty);
        }

        private void FBCButton_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();
            if (openFileDlg.ShowDialog() == true)
                this.FileName = openFileDlg.FileName;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.CurrentConnectionString))
            {
                string sel = ((ComboBoxItem)combobox_Table.SelectedValue).Content.ToString();


                using (SqlCommand cmd = new SqlCommand($"insert{sel}FromXML", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;


                    cmd.Parameters.AddWithValue("@path", FileName);
                    try
                    {
                        cmd.ExecuteNonQuery();
                        var result = returnParameter.Value;

                        MessageBox.Show($"{result.ToString()} rows was inserted");

                    }
                    catch (Exception ee)
                    {
                        MessageBox.Show(ee.Message);
                    }
                }
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Metadata.ConnectionString.defaultString))
            {
                using (SqlCommand cmd = new SqlCommand("exportOrdersToXMLBetweenDate", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@path", fileExport.Text);
                    cmd.Parameters.AddWithValue("@Date1", DateFrom.SelectedDate.Value);
                    cmd.Parameters.AddWithValue("@Date2", DateTo.SelectedDate.Value);

                    cmd.ExecuteNonQuery();

                    MessageBox.Show($"{fileExport.Text} was created with data");


                }
            }


        }
    }
}