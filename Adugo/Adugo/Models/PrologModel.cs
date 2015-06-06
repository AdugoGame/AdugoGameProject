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
    class PrologModel
    {

        public static void test()
        {
            CodeSentence[] codeSentence;

            //codeSentence = Prolog.Parser.Parse(System.IO.File.ReadAllText("../../Prolog/adugo.prolog"));
            codeSentence = Prolog.Parser.Parse("tokenMove(10,0,1,1,0,1,0,1,1).tokenMove(11,0,1,0,1,1,0,1,0).tokenMove(12,1,1,1,1,1,1,1,1).tokenMove(13,0,1,0,1,1,0,1,0).tokenMove(14,1,1,0,1,0,1,1,0).tokenMove(15,0,1,0,0,1,0,1,0).tokenMove(16,1,1,1,1,1,1,1,1).tokenMove(17,0,1,0,1,1,0,1,0).tokenMove(18,1,1,1,1,1,1,1,1).tokenMove(19,0,1,0,1,0,0,1,0). tokenMove(20,0,1,1,0,1,0,0,0).tokenMove(21,0,1,0,1,1,0,0,0).tokenMove(22,1,1,1,1,1,1,1,1).tokenMove(23,0,1,0,1,1,0,0,0).tokenMove(24,1,1,0,1,0,0,0,0).tokenMove(25,0,0,0,0,0,0,0,0).tokenMove(26,0,0,1,0,1,1,0,1).tokenMove(27,0,1,0,1,1,0,1,0).tokenMove(28,1,0,0,1,0,1,0,1).tokenMove(29,0,0,0,0,0,0,0,0).tokenMove(30,0,0,1,0,0,0,0,0).tokenMove(31,0,0,0,0,0,0,0,0).tokenMove(32,0,1,0,0,0,0,0,0).tokenMove(33,0,0,0,0,0,0,0,0).tokenMove(34,1,0,0,0,0,0,0,0).");
            Program program = new Program();
            foreach (var sentence in codeSentence)
            {
                program.Add(sentence);
            }

            //codeSentence = Prolog.Parser.Parse(":-hello(X)");
            Query query = new Query(Parser.Parse(":-tokenMove(X,0,1,0,1,1,0,1,0).")[0]);

            PrologMachine machine = PrologMachine.Create(program, query);
            ExecutionResults results = machine.RunToSuccess();
            MessageBox.Show(machine.QueryResults.m_variables[0].CodeTerm.ToString());
            MessageBox.Show(results.ToString());

        }

        void test2()
        {
            Program program = Program.Load("Prolog/adugo.prolog");

        }


    }
}
