using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
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

       

        private static IList<PointDataModel> _ButtonsData;

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


        public AbilityToMove AbilityToMove(int Id)
        {
            AbilityToMove ability = new AbilityToMove();

            if (Id < 25)
            {
                if (Id%2 == 1)
                {
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                }

                if (Id/5 == 0)
                {
                    ability.Up = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                }

                if (Id%5 == 0)
                {
                    ability.Left = false;
                    ability.LeftUp = false;
                    ability.LeftDown = false;
                }

                if (Id%5 == 4)
                {
                    ability.Right = false;
                    ability.RightDown = false;
                    ability.RightUp = false;
                }

                if (Id/5 == 4 && Id != 22)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.RightDown = false;
                }
            }

            else
            {
                if (Id == 25 || Id == 29 || Id == 31 || Id == 33)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.Up = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                    ability.Left = false;
                    ability.Right = false;
                }
                if (Id == 26)
                {
                    ability.Down = false;
                    ability.RightDown = false;
                    ability.Up = false;
                    ability.LeftUp = false;
                    ability.Left = false;
                    
                }

                if (Id == 27)
                {
                    ability.Down = false;
                    ability.Up = false;
                    ability.Left = false;
                    ability.Right = false;
                }

                if (Id == 28)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.Up = false;
                    ability.RightUp = false;
                    ability.Right = false;
                }

                if (Id == 30)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.Up = false;
                    ability.LeftUp = false;
                    ability.Left = false;
                    
                }

                if (Id == 32)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                    
                }

                if (Id == 34)
                {
                    ability.Down = false;
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.Up = false;
                    ability.RightUp = false;
                    ability.Right = false;
                }


            }



            return ability;
        }

        public AbilityToMove AbilityToMove(PointDataModel pointDataModel)
        {
            return AbilityToMove(pointDataModel.Id);
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
            const int LeftStart = -340;
            const int LeftZmiana = 95;
            const int TopStart = 10;
            int TopShift = 0;
            
            for (int j = 0; j < 5; j++)
            {

                for (int i = 0; i < 7; i++)
                {
                    ButtonsData.Add(new PointDataModel() 
                    {
                        Id = i*5+j, Left = j * LeftZmiana + LeftStart,
                        Top = i * 3 * TopStart - TopShift,
                        Size = PionekSize
                    });
                }

                TopShift += 49*TopStart;

            }

            SetStartValueForMatrix();
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
