using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Adugo.Models
{
    class GameControl
    {
        public enum PlayerRound {Doge=0, Jaguar=1}

        public PlayerRound Turn;
        public int DogeCount;
        public int Moves;

        public GameControl()
        {
  
             
            DogeCount = 14;
            Moves = 0;
            Turn = PlayerRound.Jaguar;
            MessageBox.Show("Info: Zaczyna jaguar");
        }

        public void NextTurn()
        {
            if (Turn == PlayerRound.Jaguar)
            {
                Turn = PlayerRound.Doge;
                MessageBox.Show("Info: Tura psa");
            }
            else
            {
                Turn = PlayerRound.Jaguar;
                Moves++;
                MessageBox.Show("Info: Tura jaguara");
            }
            
        }

    }
}
