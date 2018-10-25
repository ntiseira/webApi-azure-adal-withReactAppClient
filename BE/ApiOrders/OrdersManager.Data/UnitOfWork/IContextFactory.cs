using OrdersManager.Data.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Data.UnitOfWork
{
    /// <summary>
    /// Context factory interface
    /// </summary>
    public interface IContextFactory
    {
        DbContext GetDbContext { get; }

       // DbContext DbContext();

    }
}
