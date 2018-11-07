using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.DTOs
{
    public class OrderDTO
    {
        public int Id { get; set; }

        public Customer OrderCustomer{ get; set; }

        public int OrderId { get; set; }

        public DateTime Created_At { get; set; }
        public string shipAdress { get; set; }
        public string shipCity { get; set; }

        public string shipPostalCode { get; set; }
        public string shipCountry { get; set; }
        public decimal TotalAmount { get; set; }

        public List<OrderDetailDTO> Details { get; set; }
    }
}
