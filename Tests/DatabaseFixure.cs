using Microsoft.EntityFrameworkCore;
using Reposetories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 
namespace Tests
{
    public class DatabaseFixure
    {
        public MyShop327707238Context Context { get; private set; }
        public DatabaseFixure()
        {
            var options = new DbContextOptionsBuilder<MyShop327707238Context>()
                .UseSqlServer("Server = PF2NBYFF\\SQLEXPRESS; Database = MyShop_test; Trusted_Connection = True; TrustServerCertificate = True")
                .Options;
            Context = new MyShop327707238Context(options);
            Context.Database.EnsureCreated();
        }

        public void Dispose()
        {
            Context.Database.EnsureCreated();
            Context.Dispose();
        }
    }
}
