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
    internal class PointDataModel:INotifyPropertyChanged
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

        public int Left { get; set; }

        public int Top { get; set; }

        public int Size { get; set; }

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