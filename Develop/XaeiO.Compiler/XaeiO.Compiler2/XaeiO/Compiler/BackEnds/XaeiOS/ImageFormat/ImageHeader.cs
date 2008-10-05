using System;
using System.Collections.Generic;
using System.Text;

namespace XaeiO.Compiler.BackEnds.XaeiOS.ImageFormat
{
    public class ImageHeader
    {
        private Metadata _metadata;

        public Metadata Metadata
        {
            get { return _metadata; }
            set { _metadata = value; }
        }

        private ImageFormat.Fixups _fixups;

        public ImageFormat.Fixups Fixups
        {
            get { return _fixups; }
            set { _fixups = value; }
        }
    }
}
