using System;
using System.Collections.Generic;
using System.Web.Http.Results;
using NUnit.Framework;
using OrdersManager.Api.Controllers;
using OrdersManager.Data.UnitOfWork;
using OrdersManager.Domain.DTOs;
using OrdersManager.Services;

namespace OrdersManager.Test
{
    [TestFixture]
    public class OrderTest 
    {
        [Test]
        public void GetOrdersWithoutFilter()
        {

            var orderController = UnityConfig.Resolve<OrderController>();
             
            BaseCriteriaDTO criteria = new BaseCriteriaDTO
            {
                Filter = "",
                OrderAsc = true,
                OrderBy = "",
                PageNumber = 1
            };

            var postResult = orderController.PostGetOrders(criteria);

            var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDTO>>;

            
            Assert.IsTrue(listOrders.Content.TotalItems  > 0);
        }


        [Test]
        public void GetOrdersFilterShipAdress()
        {

            var orderController = UnityConfig.Resolve<OrderController>();


            BaseCriteriaDTO criteria = new BaseCriteriaDTO
            {
                Filter = "Avellaneda 500",
                OrderAsc = true,
                OrderBy = "",
                PageNumber = 1
            };

            var postResult = orderController.PostGetOrders(criteria);

            var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDTO>>;

            Assert.IsTrue(listOrders.Content.TotalItems > 0);
        }

        [Test]
        public void GetOrdersFilterShipCity()
        {

            var orderController = UnityConfig.Resolve<OrderController>();

            BaseCriteriaDTO criteria = new BaseCriteriaDTO
            {
                Filter = "Rosario",
                OrderAsc = true,
                OrderBy = "",
                PageNumber = 1
            };

            var postResult = orderController.PostGetOrders(criteria);

            var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDTO>>;


            Assert.IsTrue(listOrders.Content.TotalItems > 0);
        }


        [Test]
        public void GetOrdersOrderByShipAdress()
        {

            var orderController = UnityConfig.Resolve<OrderController>();

            BaseCriteriaDTO criteria = new BaseCriteriaDTO
            {
                Filter = "",
                OrderAsc = true,
                OrderBy = "shipAdress",
                PageNumber = 1
            };

            var postResult = orderController.PostGetOrders(criteria);

            var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDTO>>;


            Assert.IsTrue(listOrders.Content.TotalItems > 0);
        }



        [Test]
        public void EditOrder()
        {
           

                var orderController = UnityConfig.Resolve<OrderController>();

                BaseCriteriaDTO criteria = new BaseCriteriaDTO
                {
                    Filter = "",
                    OrderAsc = true,
                    OrderBy = "",
                    PageNumber = 1
                };

                var postResult = orderController.PostGetOrders(criteria);

                var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDTO>>;

                //Modify Entity
                var entity = listOrders.Content.CurrentPageItems[0];
                entity.shipAdress = "sarasa";

            entity.Details[0].Quantity = 10000;
            entity.Details[0].Discount= 10000;

            orderController.PostEditOrder(entity);

                UnityConfig.Resolve<IUnitOfWork>().Commit();
           
            //  unitOfWorkSession.Commit();
            //Assert.IsTrue(unitOfWorkSession.Commit()));
        }



        [Test]
        public void GetOrderDetails()
        {

            var orderController = UnityConfig.Resolve<OrderController>();

            BaseCriteriaDTO criteria = new BaseCriteriaDTO
            {   IdOrder = 1,
                Filter = "",
                OrderAsc = true,
                OrderBy = "",
                PageNumber = 1
            };

            var postResult = orderController.PostGetOrdersDetails(criteria);

            var listOrders = postResult as OkNegotiatedContentResult<PagedListDTO<OrderDetailDTO>>;


            Assert.IsTrue(listOrders.Content.TotalItems > 0);
        }




    }
}
