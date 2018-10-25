using OrdersManager.Domain;
using OrdersManager.Domain.DTOs;
using OrdersManager.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
 

namespace OrdersManager.Api.Controllers
{
    [Authorize]
    [RoutePrefix("api")]
    public class OrderController : ApiController
    {

        private readonly IOrderService orderService;

        /// <summary>
        /// Initializes a new instance of the <see cref="OrderController"/> class.
        /// </summary>
        /// <param name="orderService">The device service.</param>
        public OrderController(IOrderService orderService)
        {
            this.orderService = orderService;
        }

        /// <summary>
        /// Gets the specified page.
        /// </summary>
        /// <param name="page">The page.</param>
        /// <param name="pageSize">Size of the page.</param>
        /// <returns></returns>     
         [Route("Order/PostGetOrders")]
        public IHttpActionResult PostGetOrders ([FromBody]BaseCriteriaDTO criteria)
        {
            if (criteria == null)
                return BadRequest();
            PagedListDTO<OrderDTO> result = orderService.GetOrders(criteria);

            return Ok(result);
        }


        [Route("Order/PostEditOrder")]
        public IHttpActionResult PostEditOrder([FromBody]OrderDTO orderDto)
        {
            if (orderDto == null)
                return BadRequest();

            orderService.EditOrder(orderDto);

            return Ok();
        }

    }
}
