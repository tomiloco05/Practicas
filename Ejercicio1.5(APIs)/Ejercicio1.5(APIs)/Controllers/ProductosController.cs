using ArticulosBack.Data;
using System;
using ArticulosBack.Entities;
using ArticulosBack.Services;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace Ejercicio1._5_APIs_.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController :ControllerBase
    {
        private ProductManager oProductManager;
        public ProductosController()
        {
            oProductManager = new ProductManager();
        }
        [HttpGet("BuscarTodos")]
        public IActionResult RecuperarProductos()
        {
            return Ok(oProductManager.GetAll());
        }
        [HttpGet("BuscarPorID")]
        public IActionResult BuscarProducto(int id)
        {
            return Ok(oProductManager.GetByID(id));
        }
        [HttpPut("GuardarProducto")]
        public IActionResult GuardarProducto([FromBody] Product oProducto)
        {
            try
            {
                if (oProducto == null)
                {
                    return BadRequest("Se esperaba un producto completo");
                }
                if (oProductManager.GetByID(oProducto.Codigo) == null)
                {
                    if (oProductManager.Save(oProducto))
                    {
                        return Ok("producto registrado con extio");
                    }
                    else
                    {
                        return StatusCode(500, "no se pudo registrar el producto");
                    }
                }
                else
                {
                    
                    if (oProductManager.Update(oProducto))
                    {
                        return Ok("producto actualizado con exito");
                    }
                    else
                    {
                        return StatusCode(500, "no se pudo actualizar el producto");
                    }
                }
            }
            catch (Exception)
            {
                return StatusCode(500, "error interno");
            }
        }
        [HttpDelete("BorrarProducto")]
        public IActionResult BorrarProducto(int id)
        {
            return Ok(oProductManager.Delete(id));
        }
    }
}
