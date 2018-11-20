using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Rating
    {
        public Int32 UserID { get; set; }
        public Int32 Rest_ID { get; set; }
        public String Street { get; set; }
        public String ZipCode { get; set; }
        public float StarRating { get; set; }
        public String Review { get; set; }
    }
}
