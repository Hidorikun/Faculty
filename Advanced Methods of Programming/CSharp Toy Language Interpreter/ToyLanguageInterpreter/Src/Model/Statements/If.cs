using ToyLanguageInterpreter.Src.Model.Expressions;

namespace ToyLanguageInterpreter.Src.Model.Statements
{
    class If : IStatement
    {
        private IExpression exp;
        private IStatement thenS;
        private IStatement elseS;

        public If(IExpression e, IStatement t)
        {
            exp = e;
            thenS = t;
            elseS = null;
        }

        public If(IExpression e, IStatement t, IStatement el)
        {
            exp = e;
            thenS = t;
            elseS = el;
        }

        public ProgramState Exec(ProgramState state)
        {
            if (exp.Eval(state) > 0)
            {
                return thenS.Exec(state);
            }

            if (elseS == null)
            {
                return null;
            }

            return elseS.Exec(state);
        }
        
    
        public override string ToString()
        {
            return "IF(" + exp.ToString() + ") THEN (" + thenS.ToString() + " ) ELSE (" + elseS.ToString() + ")";
        }
    }
}
