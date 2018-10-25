using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.Mapping
{
    public class ProductMap : EntityTypeConfiguration<Product>
    {

        public ProductMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
            .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Table & Column Mappings
            this.ToTable("Products");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Name).HasColumnName("name");
            this.Property(t => t.Unitprice).HasColumnName("unitprice");
            this.Property(t => t.UnitInStock).HasColumnName("unitsInstock");
        }

    }
}
