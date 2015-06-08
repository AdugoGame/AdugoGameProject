using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Prolog;
using Prolog.Code;

namespace Adugo.Models
{
    public static class PrologModel
    {
        static CodeSentence[] codeSentence;

        private static Program program;

        public static void Load()
        {
            codeSentence = Prolog.Parser.Parse(System.IO.File.ReadAllText("../../Prolog/adugo.prolog"));
            program = new Program();
            foreach (var sentence in codeSentence)
            {
                program.Add(sentence);
            }
        }

        public static string LoadResponse(string strquery)
        {
            Query query = new Query(Parser.Parse(strquery)[0]);

            PrologMachine machine = PrologMachine.Create(program, query);
            ExecutionResults results = machine.RunToSuccess();
            if (results.ToString() == "Succes")
            { 
            return machine.QueryResults.m_variables[0].CodeTerm.ToString();
            }
            else if(results.ToString()=="Failure")
            {
                MessageBox.Show("Wygrałeś!!!");
                return "wygrales";
            }
            else
            {
                return machine.QueryResults.m_variables[0].CodeTerm.ToString();
            }
        }

            //codeSentence = Prolog.Parser.Parse(":-hello(X)");
            

        



    }
}
