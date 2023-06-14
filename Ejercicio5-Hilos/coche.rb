# La clase para representar coches de ocasion y de segunda mano ha de contar con atributos para
# almacenar el numero de identificacion, el fabricante, el año de fabricacion (entre 1900 y 2022),
# el modelo, las millas por galon, y el precio en euros del vehıculo. Tambien se debe representar el
# conjunto de propietarios que ha tenido del vehıculo con un numero de telefono y un nombre.
# Describe la jerarquía de clases y estructura de directorio.

class Coche

  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :precio, :propietarios, :indicadores
  
  def initialize(id, fabricante, year_fabricacion, modelo, precio, propietarios, indicadores)
    @id = id
    @fabricante = fabricante
    if (year_fabricacion >= 1900 && year_fabricacion <= 2022)
      @year_fabricacion = year_fabricacion
    else
      raise ArgumentError, "El año de fabricación debe estar entre 1900 y 2022"
    end
    @modelo = modelo
    @precio = precio
    @propietarios = propietarios
    if (indicadores.length != 4)
      raise ArgumentError, "El número de indicadores debe ser 4"
    else
      @indicadores = indicadores
    end
  end

  def to_s 
    "Coche #{@id}"
  end
  
  def volumenVentas
    @ventas[0] * @ventas[1]
  end

end
