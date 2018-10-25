using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.DTOs
{
    public class PagedListDTO<T>
    {
        public PagedListDTO(int totalItems, int pageSize, List<T> items, int currentPageNumber)
        {
            this.TotalItems = totalItems;
            this.TotalPages = (totalItems / pageSize) + ((totalItems % pageSize) > 0 ? 1 : 0);
            this.CurrentPage = currentPageNumber;
            this.CurrentPageItems = items;
        }

        public int TotalItems { get; set; }
        public int TotalPages { get; set; }
        public int CurrentPage { get; set; }


        public List<T> CurrentPageItems { get; set; }
    }
}
