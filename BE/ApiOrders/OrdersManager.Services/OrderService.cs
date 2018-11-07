using OrdersManager.Data.Helper;
using OrdersManager.Data.Repository.Base;
using OrdersManager.Data.UnitOfWork;
using OrdersManager.Domain;
using OrdersManager.Domain.DTOs;
using OrdersManager.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Services
{
    public class OrderService : IOrderService
    {

        private readonly IUnitOfWork unitOfWork;
        private Data.Repository.Base.IRepository<Order> orderRepository;
        private Data.Repository.Base.IRepository<OrderDetail> orderDetailsRepository;


        /// <inheritdoc />
        public OrderService(
            IUnitOfWork unitOfWork 
            )
        {
            this.unitOfWork = unitOfWork;     

        }

        public void EditOrder(OrderDTO orderDto)
        {
            orderRepository = unitOfWork.GetRepository<Order>();

            var orderEntity = orderRepository.Get(orderDto.Id);

            orderEntity.Id = orderDto.Id;
            orderEntity.ShipAdress = (orderDto.shipAdress != null) ? orderDto.shipAdress : orderEntity.ShipAdress;
            orderEntity.ShipCity = (orderDto.shipCity != null) ? orderDto.shipCity : orderEntity.ShipCity;
            orderEntity.ShipCountry = (orderDto.shipCountry != null) ? orderDto.shipCountry : orderEntity.ShipCountry;
            orderEntity.ShipPostalCode = (orderDto.shipPostalCode != null) ? orderDto.shipPostalCode : orderEntity.ShipPostalCode;
            orderEntity.TotalAmount = (orderDto.TotalAmount > 0) ? orderDto.TotalAmount : orderEntity.TotalAmount;
            orderEntity.OrdersDetails = orderDto.Details.Select(a => new OrderDetail {Id = a.Id,  ProductId = a.ProductId, Discount = a.Discount, Quantity = a.Quantity }).ToList();

            orderRepository.Update(orderEntity);
        }


        public PagedListDTO<OrderDTO> GetOrders(BaseCriteriaDTO criteria)
        {

            orderRepository = unitOfWork.GetRepository<Order>();

            //PageSize
            int pageSize = Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"].ToString());

            //filter (expression in DB)
            Expression<Func<Order, bool>> filterExpression = x =>x.Id > 0;

            if (!string.IsNullOrWhiteSpace(criteria.Filter))

                filterExpression = filterExpression.Join(
                         x =>
                         x.OrderCustomer.ContactName.ToUpper().Contains(criteria.Filter.ToUpper()) ||
                         x.ShipAdress.ToUpper().Contains(criteria.Filter.ToUpper())
                        || x.ShipCity.ToUpper().Contains(criteria.Filter.ToUpper())
                        || x.ShipCountry.ToUpper().Contains(criteria.Filter.ToUpper())
                        || x.ShipPostalCode.ToUpper().Contains(criteria.Filter.ToUpper())
                        || x.TotalAmount.ToString().Contains(criteria.Filter.ToString())
                        );

            //order by
            Expression<Func<Order, object>>[] orderByExpressions = this.GetOrderByExpressions_Orders(criteria.OrderBy);

            //get entities
            int totalItems;

            IQueryable<Order> q = orderRepository.GetAll(out totalItems, criteria.PageNumber,
                pageSize, filterExpression, criteria.OrderAsc, new string[] { "OrderCustomer", "OrdersDetails", "OrdersDetails.ProductSold" }, orderByExpressions);

            //parse to DTO
            List<OrderDTO> items = q.ToList().Select(m => new OrderDTO
            {
                Id = m.Id,
                Created_At = m.Created_At,
                OrderCustomer = m.OrderCustomer,
                Details = m.OrdersDetails.Select(a => new OrderDetailDTO { Id = a.Id, OrderId= m.Id,  Discount = a.Discount,ProductId = a.ProductId, ProductName = a.ProductSold.Name, Quantity = a.Quantity }).ToList(),
                shipAdress = m.ShipAdress,
                shipCity = m.ShipCity,
                shipCountry= m.ShipCountry,
                 shipPostalCode= m.ShipPostalCode,
                TotalAmount= m.TotalAmount                
            }).ToList();

            return new PagedListDTO<OrderDTO>(totalItems, pageSize, items, criteria.PageNumber);
        }

        public PagedListDTO<OrderDetailDTO> GetOrdersDetails(BaseCriteriaDTO criteria)
        {

            orderDetailsRepository = unitOfWork.GetRepository<OrderDetail>();

            //PageSize
            int pageSize = Convert.ToInt32(ConfigurationManager.AppSettings["pageSize"].ToString());

            //filter (expression in DB)
            Expression<Func<OrderDetail, bool>> filterExpression = x =>x.Id == criteria.IdOrder;
            
            if (!string.IsNullOrWhiteSpace(criteria.Filter))

                filterExpression = filterExpression.Join(
                         x =>
                         x.ProductSold.Name.ToUpper().Contains(criteria.Filter.ToUpper()) ||
                         x.Quantity.ToString().ToUpper().Contains(criteria.Filter.ToUpper())
                        || x.Discount.ToString().ToUpper().Contains(criteria.Filter.ToUpper())                        
                        );

            //order by
            Expression<Func<OrderDetail, object>>[] orderByExpressions = this.GetOrderDetailsByExpressions_Orders(criteria.OrderBy);

            //get entities
            int totalItems;

            IQueryable<OrderDetail> q = orderDetailsRepository.GetAll(out totalItems, criteria.PageNumber,
                pageSize, filterExpression, criteria.OrderAsc, new string[] { "ProductSold" }, orderByExpressions);

            var listOrderDetails = q.ToList();

            //parse to DTO
            List<OrderDetailDTO> items = q.ToList().Select(m => new OrderDetailDTO
            {
                Id = m.Id,
                ProductName = m.ProductSold.Name,
                Quantity = m.Quantity,                
                Discount= m.Discount
            }).ToList();

            return new PagedListDTO<OrderDetailDTO>(totalItems, pageSize, items, criteria.PageNumber);
        }



        #region Private Methods

        private Expression<Func<Order, object>>[] GetOrderByExpressions_Orders(string orderBy)
        {
            var result = new List<Expression<Func<Order, object>>>();

            switch (orderBy)
            {
                case nameof(OrderDTO.Id):
                result.Add((Order x) => x.Id); break;
                case nameof(OrderDTO.OrderCustomer.ContactName):
                result.Add((Order x) => x.OrderCustomer.ContactName); break;
                case nameof(OrderDTO.shipAdress):
                result.Add((Order x) => x.ShipAdress); break;
                case nameof(OrderDTO.shipCity):
                result.Add((Order x) => x.ShipCity); break;
                case nameof(OrderDTO.shipPostalCode):
                result.Add((Order x) => x.ShipPostalCode); break;
                case nameof(OrderDTO.shipCountry):
                result.Add((Order x) => x.ShipCountry); break;
                case nameof(OrderDTO.TotalAmount):
                result.Add((Order x) => x.TotalAmount); break;
                case nameof(OrderDTO.Created_At):
                break;//this is considered by default
            }

            result.Add((Order x) => x.Id);
            result.Add((Order x) => x.Created_At);
            return result.ToArray();
        }


        private Expression<Func<OrderDetail, object>>[] GetOrderDetailsByExpressions_Orders(string orderBy)
        {
            var result = new List<Expression<Func<OrderDetail, object>>>();

            switch (orderBy)
            {
                case nameof(OrderDetailDTO.Id):
                result.Add((OrderDetail x) => x.Id); break;
                case nameof(OrderDetailDTO.ProductName):
                result.Add((OrderDetail x) => x.ProductSold.Name); break;
                case nameof(OrderDetailDTO.Quantity):
                result.Add((OrderDetail x) => x.Quantity); break;
                case nameof(OrderDetailDTO.Discount):
                result.Add((OrderDetail x) => x.Discount);           
                break;//this is considered by default
            }

            result.Add((OrderDetail x) => x.OrderId);

            return result.ToArray();
        }

        #endregion
    }
}
