
namespace ToyLanguageInterpreter.Src.Model.Expressions.Arithmetic
{
    class Subtraction : IExpression
    {
        private IExpression exp1;
        private IExpression exp2;

        public Subtraction(IExpression exp1, IExpression exp2)
        {
            this.exp1 = exp1;
            this.exp2 = exp2;
        }

        public int Eval(ProgramState state)
        {
            return exp1.Eval(state) - exp2.Eval(state);
        }

        public override string ToString()
        {
            return "(" + exp1.ToString() + " - " + exp2.ToString() + ")";
        }

    }
}
