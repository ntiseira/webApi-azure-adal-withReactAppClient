﻿using OrdersManager.Domain;
using OrdersManager.Domain.Mapping;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Data.Context
{
    public class OrderContext : DbContext
        //, IDbContext
    {
        ///// <summary>
        ///// Initializes a new instance of the <see cref="DeviceContext"/> class.
        ///// </summary>
        ///// <param name="options">The options.</param>
        //public OrderContext(DbContext options)
        // //   : base(options)
        //{
        //    // TODO: Comment below this if you are running migrations commands
        //    // TODO: uncomment below line of you are running the application for the first time
        //    //this.Database.EnsureCreated();
        //}

        public OrderContext()
                   : base("Name=OrderContext")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }

        /// <summary>
        /// Get or sets the devices data model
        /// </summary>
        public DbSet<Customer> Customers { get; set; }

        public DbSet<OrderDetail> OrdersDetails { get; set; }


        public DbSet<Product> Products { get; set; }


        public DbSet<Order> Orders { get; set; }

        /// <summary>
        /// Relation between tables.
        /// </summary>
        /// <param name="modelBuilder">Entity framework model builder before creating database</param>
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CustomerMap());
            modelBuilder.Configurations.Add(new OrderDetailMap());
            modelBuilder.Configurations.Add(new ProductMap());
            modelBuilder.Configurations.Add(new OrderMap());
        }
    }
}
