using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adugo.Models
{
    public static class ArrayPrologModel
    {
        public static string ArrayToPrologList(PointDataModel[] tab)
        {
            string list = "[";

            for (int i = 0; i < tab.Count(); i++)
            {
                if (i == tab.Count() - 1)
                {
                    list += tab[i].ValueForMatrix.ToString();
                }
                else
                {
                    list += tab[i].ValueForMatrix.ToString()+", ";
                }
            }

            return list+ "]";
        }

        public static PointDataModel[] PrologListToArray(PointDataModel[] tab, string list)
        {
            int iter = 0;
            foreach (char c in list)
            {
                if (c >= '0' && c <= '9')
                {
                    tab[iter].ValueForMatrix = Convert.ToInt32(c.ToString());
                    iter++;
                }
            }
            return tab;
        }
    }
}
