using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Adugo.ViewModels;

namespace Adugo.Models
{
    public class PointDataModel:INotifyPropertyChanged
    {
        public string ContentString { get; set; }

        private int _Id;

        public int Id
        {
            get { return _Id; }
            set
            {
                
                    _Id = value;
                    ContentString = value.ToString();
                
            }
        }

        public string _Background;

        public string Background
        {
            get { return _Background; }
            set
            {
                if (value != _Background)
                {
                    _Background = value;
                    OnPropertyChanged();
                }
            }
        }


        public string _Visibility;

        public string Visibility
        {
            get { return _Visibility; }
            set
            {
                if (value != _Visibility)
                {
                    _Visibility = value;
                    OnPropertyChanged();
                }
            }
        }


        public int Left { get; set; }

        public int Top { get; set; }

        public int Size { get; set; }

        private int _ValueForMatrix ;

        public int ValueForMatrix   // Do wdrozenia
        {
            get { return _ValueForMatrix; }
            set
            {
                if (value != _ValueForMatrix)
                {
                    _ValueForMatrix = value;
                    if (_ValueForMatrix == 0)
                    {
                        Visibility = ButtonVisibility.Hidden;
                    }
                    else if (_ValueForMatrix == 1)
                    {
                        Visibility = ButtonVisibility.Visible;
                        Background = ButtonBackgrounds.Doge;
                    }
                    else if (_ValueForMatrix == 2)
                    {
                        Visibility = ButtonVisibility.Visible;
                        Background = ButtonBackgrounds.Jaguar;
                    }
                }
            }
        } // do settera dolozyc zmiane obrazka w Background

        public DelegateCommand SelectItemCommand { get; set; }



        public PointDataModel()
        {
            SelectItemCommand = new DelegateCommand(SetSelectedItem,delegate { return true; });
        }

        private void SetSelectedItem(object obj)
        {
            AdugoViewModel.SelectedItem = this;
        }


        public event PropertyChangedEventHandler PropertyChanged;


        #region PropertChanged
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            var handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));

        }

        #endregion
    }
}