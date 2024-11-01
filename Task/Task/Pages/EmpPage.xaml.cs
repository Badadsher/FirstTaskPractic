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
    /// Логика взаимодействия для EmpPage.xaml
    /// </summary>
    public partial class EmpPage : Page
    {
        private int iduser;
        public EmpPage(int iduser)
        {
            InitializeComponent();
            this.iduser = iduser;
            var user = AppData.db.Employees.FirstOrDefault(u => u.ID == iduser);
            hello.Content = $"Добро пожаловать,{user.Name}";

        }

        private void PayrollClick(object sender, RoutedEventArgs e)
        { 
            NavigationService.Navigate(new PayrollPage(iduser));

        }

        private void DeducClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new DeducPage(iduser));
        }

        private void ReportsClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReportsPage(iduser));
        }
    }
}
