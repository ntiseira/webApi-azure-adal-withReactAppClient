using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.Mapping
{
    public class OrderMap : EntityTypeConfiguration<Order>
    {
        public OrderMap()
        { 
          // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
            .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            

            // Table & Column Mappings
            this.ToTable("Orders");
            this.Property(t => t.Id).IsRequired().HasColumnName("Id");
            this.Property(t => t.ShipCountry).HasColumnName("shipCountry");      

            this.Property(t => t.CustomerId).HasColumnName("CustomerId");
            this.Property(t => t.ShipAdress).HasColumnName("shipAdress");
            this.Property(t => t.ShipCity).HasColumnName("shipCity");
            this.Property(t => t.ShipPostalCode).HasColumnName("shipPostalCode");
            this.Property(t => t.Created_At).HasColumnName("Created_At");

        }
    }
}
