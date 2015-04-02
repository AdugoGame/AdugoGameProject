using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Adugo.Models;

namespace Adugo.ViewModels
{
    class AdugoViewModel : INotifyPropertyChanged
    {
        public AdugoViewModel()
        {
            ButtonsData = new List<PointDataModel>();
            LoadExamplePointDataModel();
        }

       

        private IList<PointDataModel> _ButtonsData;

        public IList<PointDataModel> ButtonsData
        {
            get { return _ButtonsData; }
            set
            {
                if (!Equals(value, _ButtonsData))
                {
                    _ButtonsData = value;
                    OnPropertyChanged();
                }
            }
        }

        

        public static PointDataModel SelectedItem;
       

        private void LoadExamplePointDataModel()
        {
            ButtonsData.Add(new PointDataModel(){Content = "1",Left = 50,Top = 0,Side = 30});
            ButtonsData.Add(new PointDataModel() { Content = "2", Left = -50,Top = -30,Side = 30});
            ButtonsData.Add(new PointDataModel() { Content = "5", Left = -100, Top = 60, Side = 30 });
            ButtonsData.Add(new PointDataModel() { Content = "4", Left = -50, Top = 0, Side = 30 });

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
