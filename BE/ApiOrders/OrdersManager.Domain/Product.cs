using OrdersManager.Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain
{
    public class Product : BaseEntity
    {
        public string Name { get; set; }
            public decimal Unitprice { get; set; }
            public int UnitInStock { get; set; }

    }
}
