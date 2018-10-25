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
            //orderEntity.Created_At = orderDto.Created_At;
            //orderEntity.CustomerId = orderDto.OrderCustomer.Id;
            orderEntity.ShipAdress = (orderDto.shipAdress != null) ? orderDto.shipAdress : orderEntity.ShipAdress;
            orderEntity.ShipCity = (orderDto.shipCity != null) ? orderDto.shipCity : orderEntity.ShipCity;
            orderEntity.ShipCountry = (orderDto.shipCountry != null) ? orderDto.shipCountry : orderEntity.ShipCountry;
            orderEntity.ShipPostalCode = (orderDto.shipPostalCode != null) ? orderDto.shipPostalCode : orderEntity.ShipPostalCode;
            orderEntity.TotalAmount = (orderDto.TotalAmount > 0) ? orderDto.TotalAmount : orderEntity.TotalAmount;


            orderRepository.Update(orderEntity);

           // unitOfWork.Commit();
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
                pageSize, filterExpression, criteria.OrderAsc, new string[] { "OrderCustomer", "OrdersDetails", "OrdersDetails.ProductSold" },orderByExpressions);

            var lista = q.ToList();

            //parse to DTO
            List<OrderDTO> items = q.ToList().Select(m => new OrderDTO
            {
                Id = m.Id,
                Created_At = m.Created_At,
                OrderCustomer = m.OrderCustomer,
                Details = m.OrdersDetails.Select(a => new OrderDetailDTO { Id = a.Id, Distcount = a.Discount, ProductName = a.ProductSold.Name, Quantity = a.Quantity }).ToList(),
                shipAdress = m.ShipAdress,
                shipCity = m.ShipCity,
                shipCountry= m.ShipCountry,
                 shipPostalCode= m.ShipPostalCode,
                TotalAmount= m.TotalAmount                
            }).ToList();

            return new PagedListDTO<OrderDTO>(totalItems, pageSize, items, criteria.PageNumber);
        }


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

             result.Add((Order x) => x.Created_At);
            return result.ToArray();
        }
    }
}
