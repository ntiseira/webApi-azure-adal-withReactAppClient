using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Data.Helper
{
    public static class ExpressionExtension
    {
        public static Expression<Func<T, bool>> Join<T>(this Expression<Func<T, bool>> original, Expression<Func<T, bool>> forAdd)
        {
            return original.Compose(forAdd, Expression.AndAlso);
        }


        /// <summary>

        /// Combines the first expression with the second using the specified merge function.
        /// </summary>

        static Expression<T> Compose<T>(
            this Expression<T> first, Expression<T> second, Func<Expression, Expression, Expression> merge)

        {

            // zip parameters (map from parameters of second to parameters of first)
            var map = first.Parameters
                .Select((f, i) => new { f, s = second.Parameters[i] })
                .ToDictionary(p => p.s, p => p.f);

            // replace parameters in the second lambda expression
            // with the parameters in the first

            var secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);

            // create a merged lambda expression with parameters from the first expression
            return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        }
    }

    class ParameterRebinder : ExpressionVisitor

    {

        readonly Dictionary<ParameterExpression, ParameterExpression> _map;

        ParameterRebinder(Dictionary<ParameterExpression, ParameterExpression> map)
        {
            _map = map ?? new Dictionary<ParameterExpression, ParameterExpression>();
        }

        public static Expression ReplaceParameters(Dictionary<ParameterExpression, ParameterExpression> map, Expression exp)
        {
            return new ParameterRebinder(map).Visit(exp);
        }

        protected override Expression VisitParameter(ParameterExpression p)
        {
            ParameterExpression replacement;

            if (_map.TryGetValue(p, out replacement))
            {
                p = replacement;
            }
            return base.VisitParameter(p);

        }

    }

}
