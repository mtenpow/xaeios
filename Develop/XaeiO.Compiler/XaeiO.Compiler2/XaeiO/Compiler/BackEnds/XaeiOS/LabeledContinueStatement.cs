using XaeiO.Compiler.CodeModel;

namespace XaeiO.Compiler.BackEnds.XaeiOS
{
    public class LabeledContinueStatement : IStatement
    {
        private string _label;
        public string Label
        {
            get { return _label; }
            set { _label = value; }
        }

        public LabeledContinueStatement(string label)
        {
            _label = label;
        }
    }
}

