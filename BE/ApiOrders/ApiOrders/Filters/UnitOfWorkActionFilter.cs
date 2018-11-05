using OrdersManager.Data.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace OrdersManager.Api.Filters
{
    public class UnitOfWorkActionFilter : ActionFilterAttribute
    {
        public IUnitOfWork UnitOfWork { get; set; }

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            UnitOfWork = actionContext.Request.GetDependencyScope().GetService(typeof(IUnitOfWork)) as IUnitOfWork;
            UnitOfWork.BeginTransaction();
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            UnitOfWork = actionExecutedContext.Request.GetDependencyScope().GetService(typeof(IUnitOfWork)) as IUnitOfWork;
            try
            {
                if (actionExecutedContext.Exception == null)
                {
                    // commit if no exceptions
                    UnitOfWork.Commit();
                }
                else
                {
                    // rollback if exception
                    UnitOfWork.Rollback();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally {
                UnitOfWork.Dispose();
            }
        }
    }
}