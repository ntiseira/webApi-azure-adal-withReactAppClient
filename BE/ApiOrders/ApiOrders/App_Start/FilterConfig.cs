using OrdersManager.Api.Filters;
using System.Web;
using System.Web.Mvc;

namespace ApiOrders
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());      
        }
    }
}
