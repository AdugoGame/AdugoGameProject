using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adugo.Models
{
    public class AbilityToMove
    {
        public AbilityToMove()
        {
            Left = true;
            LeftDown = true;
            LeftUp = true;
            Up = true;
            Down = true;
            Right = true;
            RightUp = true;
            RightDown = true;
        }
        public bool LeftUp { get; set; }
        public bool Up { get; set; }
        public bool RightUp { get; set; }
        public bool Left { get; set; }
        public bool Right { get; set; }
        public bool LeftDown { get; set; }
        public bool Down { get; set; }
        public bool RightDown { get; set; }

        public static AbilityToMove GetAbilityToMove(int Id)
        {
            AbilityToMove ability = new AbilityToMove();

            if (Id < 25)
            {
                if (Id % 2 == 1)
                {
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                }
                
                if (Id / 5 == 0)
                {
                    ability.Up = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
                }
                
                if (Id % 5 == 0)
                {
                    ability.Left = false;
                    ability.LeftUp = false;
                    ability.LeftDown = false;
                }

                if (Id % 5 == 4)
                {
                    ability.Right = false;
                    ability.RightDown = false;
                    ability.RightUp = false;
                }

                if (Id / 5 == 4 && Id != 22)
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
                    ability.LeftDown = false;
                    ability.RightDown = false;
                    ability.LeftUp = false;
                    ability.RightUp = false;
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

        public static AbilityToMove GetAbilityToMove(PointDataModel pointDataModel)
        {
            return GetAbilityToMove(pointDataModel.Id);
        }

        public static bool TestAbilityToMove(PointDataModel IdFrom, PointDataModel IdTo)
        {
            AbilityToMove AbSource = GetAbilityToMove(IdFrom);
                int deltaID = IdFrom.Id - IdTo.Id;
                switch (deltaID)
                {
                    case 6:
                        if (AbSource.LeftUp)
                            return true;
                        break;
                    case 5:
                        if (AbSource.Up)
                            return true;
                        break;
                    case 4:
                        if (AbSource.RightUp)
                            return true;
                        break;
                    case 1:
                        if (AbSource.Left)
                            return true;
                        break;
                    case -1:
                        if (AbSource.Right)
                            return true;
                        break;
                    case -4:
                        if (AbSource.LeftDown)
                            return true;
                        break;
                    case -5:
                        if (AbSource.Down)
                            return true;
                        break;
                    case -6:
                        if (AbSource.RightDown)
                            return true;
                        break;
                    default:
                        if ((IdFrom.Id == 30 & IdTo.Id == 32) ||
                            (IdFrom.Id == 32 & IdTo.Id == 30) ||
                            (IdFrom.Id == 32 & IdTo.Id == 34) ||
                            (IdFrom.Id == 34 & IdTo.Id == 32))
                            return true;
                        break;
                }
            return false;
        }
    }
}
