using System;
using System.Collections.Generic;
using System.Text;

using Mono.Cecil;

namespace XaeiO.Compiler.CodeModel
{
    public class FieldReferenceExpression : IFieldReferenceExpression
    {
        #region IFieldReferenceExpression Members

        public Mono.Cecil.FieldReference Field
        {
            get
            {
                return _field;
            }
            set
            {
                _field = value;
            }
        }
        private FieldReference _field;

        public IExpression Target
        {
            get
            {
                return _target;
            }
            set
            {
                _target = value;
            }
        }
        private IExpression _target;

        #endregion

        #region IExpression Members

        public Mono.Cecil.TypeReference Type
        {
            get
            {
                return Field.FieldType;
            }
            set
            {
                throw new NotSupportedException();
            }
        }

        #endregion

        public FieldReferenceExpression(IExpression target, FieldReference field)
        {
            _target = target;
            _field = field;
        }

        internal FieldReferenceExpression()
        {
        }

        public override string ToString()
        {
            return string.Format("{0}.{1}", Target, Field.Name);
        }
    }
}
