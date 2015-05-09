using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Lingua;
using Prolog;
using Prolog.Code;

namespace Adugo.Models
{
    class PrologModel
    {

        private void test()
        {
            CodeSentence codeSentence;

            codeSentence = Prolog.Parser.Parse("hello(world)")[0];
            Program program = new Program();
            program.Add(codeSentence);

            codeSentence = Prolog.Parser.Parse(":-hello(X)")[0];
            Query query = new Query(codeSentence);

            PrologMachine machine = PrologMachine.Create(program, query);
            ExecutionResults results = machine.RunToSuccess();
        }

        void test2()
        {
            Program program = Program.Load("Prolog/adugo.prolog");

        }


    }
}
