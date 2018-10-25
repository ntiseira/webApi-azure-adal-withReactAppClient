using CommonServiceLocator;
using NUnit.Framework;
using OrdersManager.Data.UnitOfWork;
using System.Linq;
using System.Security.Principal;
 

namespace OrdersManager.Test
{
    [SetUpFixture]
    public class TestsSetup
    {
        [OneTimeSetUp]
        public void GlobalSetup()
        {          
            UnityConfig.Resolve<IUnitOfWork>().BeginTransaction();
        }

        [OneTimeTearDown]
        public void GlobalTeardown()
        {
            ServiceLocator.Current.GetAllInstances<IUnitOfWork>().ToList().ForEach(uow => { uow.Rollback(); uow.Dispose(); });
        }
    }
}