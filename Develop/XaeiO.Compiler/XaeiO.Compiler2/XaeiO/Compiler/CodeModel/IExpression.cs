using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public interface IExpression : ICodeObject
    {
        TypeReference Type
        {
            get;
            set;
        }
    }
}

