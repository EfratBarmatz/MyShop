﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public partial class Rating
    {
        public int RatingId { get; set; }
        public string Host { get; set; }
        public string Method { get; set; }
        public string Path { get; set; }
        public string Referer { get; set; }
        public string UserAgent { get; set; }
        public DateTime? RecordDate { get; set; }

    }
}
