using System;
using System.Windows;
using Adugo.ViewModels;

namespace Adugo
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private AdugoViewModel adugoViewModel;
        public MainWindow(bool siEnable)
        {
            adugoViewModel = new AdugoViewModel();
            DataContext = adugoViewModel;
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Console.WriteLine("wyswietlam 1");
        }



        
    }
}
