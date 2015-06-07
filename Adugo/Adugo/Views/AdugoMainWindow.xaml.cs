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
            //this.WindowStyle = WindowStyle.None; //to jest fajne
            this.ResizeMode = ResizeMode.NoResize;
        }

        private void Poddajsie_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Surrender_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        
        
    }
}
