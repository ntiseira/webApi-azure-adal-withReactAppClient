using OrdersManager.Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain
{
   public class Order : BaseEntity
    {

         public Customer OrderCustomer { get; set; }

         public List<OrderDetail> OrdersDetails { get; set; }

         public int CustomerId { get; set; }

         public DateTime  Created_At { get; set; }
         public string ShipAdress { get; set; }
         public string ShipCity { get; set; }

         public string ShipPostalCode { get; set; }
         public string ShipCountry { get; set; }
         public decimal TotalAmount { get; set; }



    }
}
