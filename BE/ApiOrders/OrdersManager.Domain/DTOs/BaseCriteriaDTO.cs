using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.DTOs
{
    public class BaseCriteriaDTO
    {
        public int IdOrder { get; set; }

        public int PageNumber { get; set; }

        private string _filter;
        public string Filter
        {
            get { return _filter; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    _filter = "";
                else
                    _filter = value.Trim();
            }
        }
        public bool OrderAsc { get; set; }

        private string _orderBy;
        public string OrderBy
        {
            get { return _orderBy; }
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    _orderBy = "";
                else
                    _orderBy = value.Trim();
            }
        }
    }
}
