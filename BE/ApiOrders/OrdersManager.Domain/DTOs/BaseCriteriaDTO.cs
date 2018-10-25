using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.DTOs
{
    public class BaseCriteriaDTO
    {
        public int PageNumber { get; set; }
        private string _filter;
        public string Filter { get { return _filter; } set { _filter = value.Trim(); } }
        public bool OrderAsc { get; set; }
        //public bool Mobile { get; set; }
        //public DateTime? DateFrom { get; set; }
        //public DateTime? DateTo { get; set; }
        public string OrderBy { get; set; }
    }
}
