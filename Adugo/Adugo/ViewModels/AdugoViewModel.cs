using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Adugo.ViewModels
{
    class AdugoViewModel : INotifyPropertyChanged
    {


        public AdugoViewModel()
        {
            color = "red";

        }

        private string _color;

        public string color
        {
            get
            {
                return _color;
            }
            set
            {
                if (value != _color)
                {
                    _color = value;
                    OnPropertyChanged();
                }
            }
        }



        

        #region PropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            var handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));

        }

        #endregion
    }
}
