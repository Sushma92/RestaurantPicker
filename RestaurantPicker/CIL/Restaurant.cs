using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    class Restaurant
    {
        public Int32 Rest_ID { get; set; }
        public String Rest_Name { get; set; }
        public String Web_Link { get; set; }
        public String ZipCode { get; set; }
        public String Street { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public float Lat { get; set; }
        public float Lon { get; set; }

    }
}
