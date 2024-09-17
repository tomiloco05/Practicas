using ArticulosBack.Data;
using ArticulosBack.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArticulosBack.Services
{
    public class ProductManager
    {
        
            public IProductoRepositorio oProductoRepositorio;

            public ProductManager()
            {
                oProductoRepositorio = new ProductoRepositorioADO();
            }
            public List<Product> GetAll()
            {
                return oProductoRepositorio.GetAll();
            }
            public Product? GetByID(int id)
            {
                return oProductoRepositorio.GetByID(id);
            }
            public bool Save(Product oProducto)
            {
                return oProductoRepositorio.Save(oProducto);
            }
            public bool Delete(int id)
            {
                return oProductoRepositorio.Delete(id);
            }
        public bool Update(Product oProducto)
        {
            return oProductoRepositorio.Update(oProducto);
        }
    }
}
