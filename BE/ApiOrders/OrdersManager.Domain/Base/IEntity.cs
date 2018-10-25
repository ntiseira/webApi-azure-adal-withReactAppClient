using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.Base
{
    public interface IEntity
    {
        int Id { get; set; }
    }
}
