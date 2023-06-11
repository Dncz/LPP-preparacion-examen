# La clase para representar coches de ocasion y de segunda mano ha de contar con atributos para
# almacenar el numero de identificacion, el fabricante, el año de fabricacion (entre 1900 y 2022),
# el modelo, las millas por galon, y el precio en euros del vehıculo. Tambien se debe representar el
# conjunto de propietarios que ha tenido del vehıculo con un numero de telefono y un nombre.
# Describe la jerarquía de clases y estructura de directorio.

class Coche
  include Enumerable
  include Comparable
  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :millas_galon, :precio, :propietarios, :ventas
  
  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios, ventas)
    @id = id
    @fabricante = fabricante
    if (year_fabricacion >= 1900 && year_fabricacion <= 2022)
      @year_fabricacion = year_fabricacion
    else
      raise ArgumentError, "El año de fabricación debe estar entre 1900 y 2022"
    end
    @modelo = modelo
    @millas_galon = millas_galon
    @precio = precio
    @propietarios = propietarios
    @ventas = ventas
  end

  def to_s 
    "Coche #{@id} #{@fabricante} #{@year_fabricacion} #{@modelo} #{@millas_galon} #{@precio} #{@propietarios}"
  end

  def volumenVentas
    @ventas[0] * @ventas[1]
  end
end

# notas de funciones de orden superior
# no es correcto poner la funcion de orden superior dentro de la clase
# se pone fuera de la clase o dentro de los test
# ToDo: QUITAR ESTAS FUNCIONES PRQUE 0 SENTIDO EN LA CLASE, sino ver explicación de Israel


def max_precio(conjuntoCoche)
  conjuntoCoche.max_by { |coche| coche.precio }.precio
end

# # función de segundo orden para calcular el coche con mayor precio
# def max_precio(arrayCoches)
#   return arrayCoches.max_by { |coche| coche.precio }.precio
# end

# # función de segundo orden para calcular el volumen de ventas minimo
# def minVolumen(arrayCoches)
#   arrayCoches.min_by { |coche| coche.volumenVentas }.volumenVentas
# end