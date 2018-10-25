using OrdersManager.Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain
{
   public class OrderDetail: BaseEntity
    {
        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public int Quantity { get; set; }
        public int Discount { get; set; }

        public Product ProductSold { get; set; }
    }
}
