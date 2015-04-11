using System.Windows;

namespace Adugo.Views
{
    /// <summary>
    /// Interaction logic for MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void Quit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void SinglePlayer_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow(true);
            window.Show();
            this.Close();
        }

        private void TwoPlayers_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow(false);
            window.Show();
            this.Close();
        }
    }
}
