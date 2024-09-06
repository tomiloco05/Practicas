﻿// See https://aka.ms/new-console-template for more information
using Actividad1_5.Domain;
using Actividad1_5.Services;
using System.Runtime.CompilerServices;

FacturasManager oFacturaManager = new FacturasManager();
ProductManager oProductManager = new ProductManager();

Random rnd = new Random();

oProductManager.Save(new Product("patata de "+rnd.Next(1,100)+" kg",rnd.Next(1,100),rnd.Next(1,100),true));

Factura oFactura = new Factura();
Console.WriteLine("Ingrese el nombre del cliente");
oFactura.Cliente = Console.ReadLine();
Console.WriteLine("Ingrese metodo de pago(0-Efectivo,1-Tarjeta)");
oFactura.MetodoPago = Convert.ToInt32(Console.ReadLine());
oFactura.Fecha = (DateTime.Now);

Console.WriteLine("Lista de productos:");
foreach (Product producto in oProductManager.GetAll())
{
    Console.WriteLine(producto.ToString());
}
while(true)
{
    
    Console.WriteLine("Ingrese el ID del articulo del detalle(0 para dejar de ingresar)");
    var id = Convert.ToInt32(Console.ReadLine());
    bool idrepetido = false;
    if (id == 0)
    {
        break;
    }
    else
    {
        foreach (DetallaFactura detalle in oFactura.Detalles)
        {
            if (detalle.Producto.Codigo == id) 
            {
                idrepetido = true;
                Console.WriteLine("Ingrese la cantidad a sumar");
                detalle.Cantidad += Convert.ToInt32(Console.ReadLine());
            }
        }
    }
    if (!idrepetido)
    {
        DetallaFactura oDetalle = new DetallaFactura();
        oDetalle.Producto = oProductManager.GetByID(id);
        oDetalle.Precio = oDetalle.Producto.Precio;
        Console.WriteLine("Ingrese la cantidad");
        oDetalle.Cantidad = Convert.ToInt32(Console.ReadLine());
        oFactura.AddDetalle(oDetalle);
    } 
}
if (oFacturaManager.Save(oFactura))
{
    Console.WriteLine("Se cargo de manera correcta la factura");
}
else 
{
    Console.WriteLine("error al cargar la factura");
}


