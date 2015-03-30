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
        public MainWindow()
        {
            adugoViewModel = new AdugoViewModel();
            DataContext = adugoViewModel;
            InitializeComponent();
        }

        
    }
}
