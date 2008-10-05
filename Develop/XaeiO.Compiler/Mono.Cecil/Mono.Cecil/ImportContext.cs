using System.Collections.Generic;
using System.Text;

namespace Mono.Cecil
{

    public class ImportContext
    {

        Stack<GenericContext> _genericContextStack = new Stack<GenericContext>();
        IImporter m_importer;

        public GenericContext GenericContext
        {
            get
            {
                if (_genericContextStack.Count == 0)
                {
                    _genericContextStack.Push(new GenericContext());
                }
                return _genericContextStack.Peek();
            }
        }

        public ImportContext(IImporter importer)
        {
            m_importer = importer;
        }

        public ImportContext(IImporter importer, IGenericParameterProvider provider)
        {
            m_importer = importer;
            _genericContextStack.Push(new GenericContext(provider));
        }

        private ImportContext(IImporter importer, GenericContext genericContext)
        {
            m_importer = importer;
            _genericContextStack.Push(genericContext);
        }

        public TypeReference Import(TypeReference type)
        {
            return m_importer.ImportTypeReference(type, this);
        }

        public MethodReference Import(MethodReference meth)
        {
            return m_importer.ImportMethodReference(meth, this);
        }

        public FieldReference Import(FieldReference field)
        {
            return m_importer.ImportFieldReference(field, this);
        }

        public void PushGenericContext(TypeReference type)
        {
            PushGenericContext(type, null);
        }

        public void PushGenericContext(MethodReference method)
        {
            PushGenericContext(method.DeclaringType, method);
        }

        public void PushGenericContext(TypeReference type, MethodReference method)
        {
            GenericContext genericContext = new GenericContext(type, method);
            _genericContextStack.Push(genericContext);
        }

        public GenericContext PopGenericContext()
        {
            return _genericContextStack.Pop();
        }

        public ImportContext Clone()
        {
            return new ImportContext(m_importer, GenericContext.Clone());
        }

        public bool SearchGenericContextStack(System.Predicate<GenericContext> action)
        {
            foreach (GenericContext genericContext in _genericContextStack)
            {
                if (action(genericContext))
                {
                    return true;
                }
            }
            return false;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            GenericContext[] gcs = _genericContextStack.ToArray();
            for (int i = 0; i < gcs.Length; i++)
            {
                sb.Append(gcs[i]);
                if (i < gcs.Length - 1)
                {
                    sb.Append(",");
                }
            }
            sb.Append("}");
            return sb.ToString();
        }
    }
}