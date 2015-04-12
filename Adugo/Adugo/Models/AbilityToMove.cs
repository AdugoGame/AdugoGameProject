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

    }
}
