using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrdersManager.Domain.Mapping
{
  public  class CustomerMap : EntityTypeConfiguration<Customer>
    {

        public CustomerMap()
        { 
         // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
            .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
       

            // Table & Column Mappings
            this.ToTable("Customer");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.ContactName).HasColumnName("ContactName");

//            ContactName
//City
//State
//PostalCode
//phoneNumber

            //this.Property(t => t).HasColumnName("CustomerId");
            //this.Property(t => t.shipAdress).HasColumnName("shipAdress");
            //this.Property(t => t.shipCity).HasColumnName("shipCity");
            //this.Property(t => t.shipPostalCode).HasColumnName("shipPostalCode");
            //this.Property(t => t.Created_At).HasColumnName("Created_At");
        }



    }
}
