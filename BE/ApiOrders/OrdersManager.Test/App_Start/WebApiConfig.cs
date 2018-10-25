using OrdersManager.Api.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace OrdersManager.Test.App_Start
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            // Web API configuration and services
            var corsOptions = new EnableCorsAttribute(
                        origins: "*",
                        headers: "*",
                        methods: "*");
            config.EnableCors(corsOptions);

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            // add UoW action filter globally
            config.Filters.Add(new UnitOfWorkActionFilter());
        }
    }
}
