using CommonServiceLocator;
using OrdersManager.Data.Repository.Base;
using OrdersManager.Data.UnitOfWork;
using OrdersManager.Services;
using OrdersManager.Services.Interfaces;
using System;
using System.Web.Http;
using Unity;
using Unity.AspNet.Mvc;
using Unity.AspNet.WebApi;
using Unity.Injection;
using Unity.Lifetime;
using Unity.ServiceLocation;

namespace OrdersManager.Api
{
    /// <summary>
    /// Specifies the Unity configuration for the main container.
    /// </summary>
    public static class UnityConfig
    {
        #region Unity Container
        private static Lazy<IUnityContainer> container =
          new Lazy<IUnityContainer>(() =>
          {
              var container = new UnityContainer();
              RegisterTypes(container);
              return container;
          });

        /// <summary>
        /// Configured Unity Container.
        /// </summary>
        public static IUnityContainer Container => container.Value;
        #endregion

        /// <summary>
        /// Registers the type mappings with the Unity container.
        /// </summary>
        /// <param name="container">The unity container to configure.</param>
        /// <remarks>
        /// There is no need to register concrete types such as controllers or
        /// API controllers (unless you want to change the defaults), as Unity
        /// allows resolving a concrete type even if it was not previously
        /// registered.
        /// </remarks>
        public static void RegisterTypes(IUnityContainer container)
        {
            var locator = new UnityServiceLocator(container);
            ServiceLocator.SetLocatorProvider(() => locator);

            container.RegisterType<IContextFactory, ContextFactory>(new PerRequestLifetimeManager());

            container.RegisterType<IUnitOfWork, UnitOfWork>(new PerRequestLifetimeManager());

            container.RegisterType(typeof(IRepository<>), typeof(Repository<>));

         
            container.RegisterType<IOrderService, OrderService>();           

            GlobalConfiguration.Configuration.DependencyResolver = new Unity.AspNet.WebApi.UnityDependencyResolver(container);
        }
    }
}