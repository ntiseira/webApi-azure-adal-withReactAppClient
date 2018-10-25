//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Linq.Expressions;
//using System.Text;
//using System.Threading.Tasks;

//namespace OrdersManager.Data.Repository.Base
//{
//  public static  class GetExtensions
//    {
//        public static IQueryable<T> GetAll<T>(this IRepository<T> repo, out int totalItems, int pageNumber, int pageSize, Expression<Func<T, bool>> filter = null, bool orderAsc = false, params Expression<Func<T, object>>[] orderByExpressions) where T : class
//        {
//            IQueryable<T> q = repo.GetAll();

//            if (filter != null)
//                q = q.Where(filter);

//            totalItems = q.Count();

//            if (orderByExpressions != null && orderByExpressions.Any())
//                if (orderAsc)
//                {
//                    q = q.OrderBy(orderByExpressions[0]);
//                    foreach (var exp in orderByExpressions.Skip(1))
//                        q = ((IOrderedQueryable<T>)q).ThenBy(exp);
//                }
//                else
//                {
//                    q = q.OrderByDescending(orderByExpressions[0]);
//                    foreach (var exp in orderByExpressions.Skip(1))
//                        q = ((IOrderedQueryable<T>)q).ThenByDescending(exp);
//                }

//            q = q.Skip(pageSize * (pageNumber - 1)).Take(pageSize);


//            return q;
//        }
//    }
//}
