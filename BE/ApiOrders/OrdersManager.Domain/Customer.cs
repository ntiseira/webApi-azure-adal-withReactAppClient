using OrdersManager.Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain
{
  public  class Customer : BaseEntity
    {
        public string ContactName { get; set; }


    }
}
