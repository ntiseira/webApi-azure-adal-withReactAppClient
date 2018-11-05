using OrdersManager.Data.Context;
using OrdersManager.Domain.Base;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Data.Repository.Base
{
    public class Repository<T> : IRepository<T>
          where T : class 
    {
        /// <summary>
        /// EF data base context
        /// </summary>
        protected readonly DbContext context;

        /// <summary>
        /// Used to query and save instances of
        /// </summary>
        private readonly DbSet<T> dbSet;

        /// <summary>
        /// Initializes a new instance of the <see cref="Repository{T}"/> class.
        /// </summary>
        /// <param name="context">The context.</param>
        public Repository(DbContext context)
        {
            
            this.context = context;

            this.dbSet = context.Set<T>();
        }

        /// <inheritdoc />
        public virtual T Add(T entity)
        {
           return this.dbSet.Add(entity);
        }

        /// <inheritdoc />
        public T Get<TKey>(TKey id)
        {
            return this.dbSet.Find(id);
        }

        /// <inheritdoc />
        public async Task<T> GetAsync<TKey>(TKey id)
        {
            return await this.dbSet.FindAsync(id);
        }

        /// <inheritdoc />
        public T Get(params object[] keyValues)
        {
            return this.dbSet.Find(keyValues);
        }

        /// <inheritdoc />
        public IQueryable<T> FindBy(Expression<Func<T, bool>> predicate)
        {
            return this.dbSet.Where(predicate);
        }

        /// <inheritdoc />
        public IQueryable<T> FindBy(Expression<Func<T, bool>> predicate, string include)
        {
            return this.FindBy(predicate).Include(include);
        }

        /// <inheritdoc />
        public IQueryable<T> GetAll()
        {
            return this.dbSet;
        }

        /// <inheritdoc />
        public IQueryable<T> GetAll(int page, int pageCount)
        {
            var pageSize = (page - 1) * pageCount;

            return this.dbSet.Skip(pageSize).Take(pageCount);
        }

        /// <inheritdoc />
        public IQueryable<T> GetAll(string include)
        {
            return this.dbSet.Include(include);
        }

      

        /// <inheritdoc />
        public IQueryable<T> GetAll(string include, string include2)
        {
            return this.dbSet.Include(include).Include(include2);
        }

        /// <inheritdoc />
        public bool Exists(Expression<Func<T, bool>> predicate)
        {
            return this.dbSet.Any(predicate);
        }

     

        /// <inheritdoc />
        public void Delete(T entity)
        {                    
            dbSet.Remove(entity);
        }

        /// <inheritdoc />
        public virtual EntityState Update(T entity)
        {
            dbSet.Add(entity);            
            var entry = context.Entry(entity);
            entry.State =  EntityState.Modified;
            
            return context.Entry(entity).State;
        }

        public IQueryable<T> GetAll(out int totalItems, int pageNumber, int pageSize, Expression<Func<T, bool>> filter = null, bool orderAsc = false,   string[] navigationProperties = null,
            params Expression<Func<T, object>>[] orderByExpressions ) 
        {
            IQueryable<T> q = this.GetAll();

            if (navigationProperties != null)
            {
                foreach (string navigationProperty in navigationProperties)
                {
                    q = q.Include(navigationProperty);//got to reaffect it.
                }
            }                     

            if (filter != null)
                q = q.Where(filter);

            totalItems = q.Count();

            SortOrder sortOrder = SortOrder.Descending;


            if (orderAsc)
                sortOrder = SortOrder.Ascending;

            foreach (var itemOrder in orderByExpressions)
            {
                q = ObjectSort(q, itemOrder, sortOrder);
            }


            q = q.Skip(pageSize * (pageNumber - 1)).Take(pageSize);


            return q;
        }



        private  IOrderedQueryable<T> ObjectSort(IQueryable<T> entities, Expression<Func<T, object>> expression, 
            SortOrder order = SortOrder.Ascending)
        {
            UnaryExpression unaryExpression = expression.Body as UnaryExpression;
            if (unaryExpression != null)
            {
                var propertyExpression = (MemberExpression)unaryExpression.Operand;
                var parameters = expression.Parameters;

                if (propertyExpression.Type == typeof(DateTime))
                {
                    var newExpression = Expression.Lambda<Func<T, DateTime>>(propertyExpression, parameters);
                    return order == SortOrder.Ascending ? entities.OrderBy(newExpression) : entities.OrderByDescending(newExpression);
                }

                if (propertyExpression.Type == typeof(int))
                {
                    var newExpression = Expression.Lambda<Func<T, int>>(propertyExpression, parameters);
                    return order == SortOrder.Ascending ? entities.OrderBy(newExpression) : entities.OrderByDescending(newExpression);
                }

                if (propertyExpression.Type == typeof(decimal))
                {
                    var newExpression = Expression.Lambda<Func<T, decimal>>(propertyExpression, parameters);
                    return order == SortOrder.Ascending ? entities.OrderBy(newExpression) : entities.OrderByDescending(newExpression);
                }

                throw new NotSupportedException("Object type resolution not implemented for this type");
            }
            return entities.OrderBy(expression);
        }
    }
}
