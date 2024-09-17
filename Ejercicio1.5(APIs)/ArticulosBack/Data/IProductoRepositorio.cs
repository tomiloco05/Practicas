using ArticulosBack.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArticulosBack.Data
{
    public interface IProductoRepositorio
    {
        List<Product> GetAll();
        Product? GetByID(int id);
        bool Save(Product oProducto);
        bool Delete(int id);
        bool Update(Product oProducto);
    }
}
