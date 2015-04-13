using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Controls;
using Adugo.Models;

namespace Adugo.ViewModels
{
    class AdugoViewModel : INotifyPropertyChanged
    {
        public AdugoViewModel()
        {
            ButtonsData = new PointDataModel[35];
            LoadExamplePointDataModel();
        }

       

        private static PointDataModel[] _ButtonsData;

        public PointDataModel[] ButtonsData
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


        private static PointDataModel _SelectedItem;
        
        public static PointDataModel SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                if (value != _SelectedItem)
                {
                    _SelectedItem = value;
                    MessageBox.Show("Zmiana");
                }
            }
        }


        

        private void SetValueForMatrix(int Id, int value)
        {
            ButtonsData[Id].ValueForMatrix = value;
        }

        private void SetStartValueForMatrix()
        {
            for (int j = 0; j < 5; j++)
            {
                for (int i = 0; i < 7; i++)
                {
                    int mId = i * 5 + j;
                    if (mId <= 14)
                    {
                        SetValueForMatrix(i * 5 + j, 1);
                    }
                    else if (mId == 17)
                    {
                        SetValueForMatrix(17, 2);
                    }
                    else
                    {
                        SetValueForMatrix(i * 5 + j, 3);
                    }
                }
            }
        }

        private void LoadExamplePointDataModel()
        {
            const int PionekSize = 70;
            const int LeftStart = -342;
            const int LeftZmiana = 99;
            const int TopStart = 10;
            int TopShift = -2;
            
            //for (int j = 0; j < 5; j++)
            //{

            //    for (int i = 0; i < 7; i++)
            //    {
            //        ButtonsData.Add(new PointDataModel() 
            //        {
            //            Id = i*5+j, Left = j * LeftZmiana + LeftStart,
            //            Top = i * 3 * TopStart - TopShift,
            //            Size = PionekSize
            //        });
            //    }

            //    TopShift += 49*TopStart;

            //}

            //SetStartValueForMatrix();

            for (int i = 0; i < 7; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    ButtonsData[i*5 + j] = new PointDataModel()
                    {
                        Id = i * 5 + j,
                        Left = j * LeftZmiana + LeftStart,
                        Top = i * 3 * TopStart - TopShift,
                        Size = PionekSize
                    };

                    TopShift += 7 * TopStart;

                }

                TopShift -= 70;

            }

            for (int i = 0; i < 15; i++)
            {
                ButtonsData[i].Background = ButtonBackgrounds.Doge;
            }


            ButtonsData[12].Background = ButtonBackgrounds.Jaguar;

            for (int i = 0; i <= 34; i++)
            {
               
                if(i==25)
                {
                    ButtonsData[i].Visibility = ButtonVisibility.Hidden;
                }
                else if (i == 29)
                {
                    ButtonsData[i].Visibility=ButtonVisibility.Hidden;
                }
                else if (i==31)
                {
                    ButtonsData[i].Visibility = ButtonVisibility.Hidden;
                }
                else if (i==33)
                {
                    ButtonsData[i].Visibility = ButtonVisibility.Hidden;
                }
                else
                {
                    ButtonsData[i].Visibility = ButtonVisibility.Visible;
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
