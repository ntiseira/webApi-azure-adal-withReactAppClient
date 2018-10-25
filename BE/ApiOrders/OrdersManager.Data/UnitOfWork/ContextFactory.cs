using OrdersManager.Data.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Data.UnitOfWork
{
    public class ContextFactory : IContextFactory
    {
        private readonly DbContext _context;

        public ContextFactory()
        {         
            _context = new OrderContext();
        }

        DbContext IContextFactory.GetDbContext => new OrderContext();       

    }
}
