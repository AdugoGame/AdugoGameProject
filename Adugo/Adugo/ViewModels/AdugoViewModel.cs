using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
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
            Game = new GameControl();
            PrologModel.Load();
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
        public int RoundNumber
        {
            get { return Game.Moves; }
            set
            {
                if (!Equals(value, Game.Moves))
                {
                    Game.Moves = value;
                    OnPropertyChanged();
                }
            }
        }

        public string _RoundBackground;

        public string RoundBackground
        {
            get
            {
                if (Game.Turn == GameControl.PlayerRound.Doge)
                {
                    return ButtonBackgrounds.Doge;
                }
                else
                {
                    return ButtonBackgrounds.Jaguar;
                }
            }

        }

        private static GameControl Game;

        private static PointDataModel _SelectedItem;
        public static PointDataModel SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                if (Game.Turn == GameControl.PlayerRound.Jaguar)
                {
                    /*
                    if (value.Background == ButtonBackgrounds.Jaguar)
                    {
                        _SelectedItem = value;
                        _SelectedItem.Background = ButtonBackgrounds.JaguarChoosen;
                    } 
                    else if (value.Background == ButtonBackgrounds.JaguarChoosen)
                    {
                        _SelectedItem.Background = ButtonBackgrounds.Jaguar;
                        _SelectedItem = null;
                    }
                    else if (value.Background == null && _SelectedItem != null)
                    {
                        if (_SelectedItem.Background == ButtonBackgrounds.JaguarChoosen)
                        {
                            if (AbilityToMove.TestAbilityToMove(_SelectedItem, value))
                            {
                                _SelectedItem.Background = null;
                                value.Background = ButtonBackgrounds.Jaguar;
                                _SelectedItem = null;
                                Game.NextTurn();
                                
                            }
                            else
                            {
                                int id = AbilityToMove.TestAbilityToKill(_SelectedItem, value);
                                if (id != -1)
                                {
                                    if (_ButtonsData[id].Background == ButtonBackgrounds.Doge)
                                    {
                                        if (AbilityToMove.TestAbilityToMove(_SelectedItem, _ButtonsData[id]))
                                        {
                                            if (AbilityToMove.TestAbilityToMove(_ButtonsData[id], value))
                                            {
                                                _ButtonsData[id].Background = null;
                                                value.Background = ButtonBackgrounds.Jaguar;
                                                _SelectedItem.Background = null;
                                                _SelectedItem = null;
                                                Game.DogeCount--;
                                                Game.NextTurn();

                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }*/
                    var prologoutput = PrologModel.LoadResponse(":-start(" + ArrayPrologModel.ArrayToPrologList(_ButtonsData) + ",X).");
                    _ButtonsData = ArrayPrologModel.PrologListToArray(_ButtonsData, prologoutput);
                    _SelectedItem = null;
                    Game.NextTurn();
                }
                else if (Game.Turn == GameControl.PlayerRound.Doge)
                {

                    
                    if (value.Background == ButtonBackgrounds.Doge && SelectedItem == null)
                    {
                        _SelectedItem = value;
                        _SelectedItem.Background = ButtonBackgrounds.DogeChoosen;
                    }
                    else if (value.Background == ButtonBackgrounds.DogeChoosen)
                    {
                        _SelectedItem.ValueForMatrix = 1;
                        _SelectedItem = null;
                    }
                    else if (value.Background == null && _SelectedItem != null)
                    {
                        if (_SelectedItem.Background == ButtonBackgrounds.DogeChoosen)
                        {
                            if (AbilityToMove.TestAbilityToMove(_SelectedItem, value))
                            {
                                _SelectedItem.ValueForMatrix = 0;
                                value.ValueForMatrix = 1;
                                _SelectedItem = null;
                                Game.NextTurn();
                            }
                        }
                    }
                     

                    
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
                //ButtonsData[i].Background = ButtonBackgrounds.Doge;
                ButtonsData[i].ValueForMatrix = 1;
            }


            //ButtonsData[12].Background = ButtonBackgrounds.Jaguar;
            ButtonsData[12].ValueForMatrix = 2;

            ButtonsData[25].ValueForMatrix = 0;

            ButtonsData[29].ValueForMatrix = 0;

            ButtonsData[31].ValueForMatrix = 0;

            ButtonsData[33].ValueForMatrix = 0;

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


//            //////////////////////TEST////////////////////////////////
//            string test = ArrayPrologModel.ArrayToPrologList(ButtonsData);
//
//            MessageBox.Show(test);
//
//            test = test.Replace('0', '1');
//
//            ButtonsData=ArrayPrologModel.PrologListToArray(ButtonsData, test);
//
//            MessageBox.Show("Test  - Zakomentuj na dole ViewModela, Warto sie zapoznać");

            ///////////////////////////////////////////////////////////////////

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
