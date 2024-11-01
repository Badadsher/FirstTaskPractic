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
using Task.Pages;

namespace Task.Pages
{
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void AuthClick(object sender, RoutedEventArgs e)
        {
            try
            {
                string log = loginTB.Text.Trim();
                string password = passwordTB.Password.Trim();
                int convertedpass = Convert.ToInt32(password);

           
                if (string.IsNullOrEmpty(log) || string.IsNullOrEmpty(password))
                {
                    MessageBox.Show("Заполните все поля!");                  
                }    
                else
                {
                    var user = AppData.db.Employees.FirstOrDefault(u => u.Name == log && u.Password == password);
                    if(user != null)
                    {
                        NavigationService.Navigate(new EmpPage(user.ID));
                    }
                    else
                    {
                        MessageBox.Show("Неверно! Попробуйте еще!");
                    }
                }
            }
            catch(Exception er)
            {
                MessageBox.Show(er.Message);
            }
        }

        private void RegClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegPage());
        }
    }
}
