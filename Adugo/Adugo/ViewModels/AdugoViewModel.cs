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
            int PionekSize = 70;
            int LeftStart = -340;
            int LeftZmiana = 95;
            int TopStart = 10;

            for (int j = 0; j < 5; j++)
            {
                for (int i = 0; i < 7; i++)
                {
                    ButtonsData.Add(new PointDataModel() { Content = (i*j).ToString(), Left = j * LeftZmiana + LeftStart, Top = i * 3 * TopStart, Size = PionekSize });
                }  
            }

            /*
            ButtonsData.Add(new PointDataModel() { Content = "1", Left = -340, Top = TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "2", Left = -340, Top = 3 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "3", Left = -340, Top = 6 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "4", Left = -340, Top = 9 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "5", Left = -340, Top = 12 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "6", Left = -340, Top = 15 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "7", Left = -340, Top = 18 * TopStart, Size = PionekSize });

            // Tu czego nie robię to blokuje się mniej więcej na środku, szlak mnie bierze przez to
            ButtonsData.Add(new PointDataModel() { Content = "8", Left = -245, Top = -21 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "9", Left = -245, Top = -24 * TopStart, Size = PionekSize });
            ButtonsData.Add(new PointDataModel() { Content = "10", Left = -245, Top = -27 * TopStart, Size = PionekSize });
            */
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
