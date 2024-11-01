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
using Task.Model;

namespace Task.Pages
{
    /// <summary>
    /// Логика взаимодействия для DeducPage.xaml
    /// </summary>
    public partial class DeducPage : Page
    {
        private int usid;
        public DeducPage(int id)
        {
            usid = id;
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            using (var context = new AccountingDataBaseEntities())
            {
                try
                {
                    spisok.ItemsSource = AppData.db.Deduc.Where(es => es.EmployeeID == usid).ToList();
                }
                catch (Exception erd)
                {
                    MessageBox.Show(erd.Message);
                }

            }
        }

        private void backClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EmpPage(usid));
        }
    }
}
