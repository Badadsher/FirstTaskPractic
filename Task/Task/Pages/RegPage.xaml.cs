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
    public partial class RegPage : Page
    {
        public RegPage()
        {
            InitializeComponent();
        }

        private void AuthClick(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthPage());
        }

        private void RegClick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(namebox.Text) || string.IsNullOrEmpty(passwordbox.Password) || combobox.SelectedIndex == -1 || string.IsNullOrEmpty(dolzbox.Text))
                {
                    MessageBox.Show("Заполните все!");
                }
                else
                {

                    MessageBox.Show("Регистрация выполнена!");

                    Employees employe = new Employees();
                    employe.ID = AppData.db.Employees.Any() ? AppData.db.Employees.Max(u => u.ID) + 1 : 1;
                    employe.Name = namebox.Text;
                    employe.Password = passwordbox.Password;
                    employe.DepartmentID = combobox.SelectedIndex + 1;
                    employe.Profession = dolzbox.Text;
                    if (combobox.SelectedIndex == 0)
                    {
                        employe.PositionID = 1;
                    }
                    else if (combobox.SelectedIndex == 1)
                    {
                        employe.PositionID = 2;
                    }
                    else
                    {
                        employe.PositionID = 3;
                    }

                    AppData.db.Employees.Add(employe);
                    AppData.db.SaveChanges();
                    NavigationService.Navigate(new AuthPage());

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }          
        }
    }
}
