# La clase para representar coches de ocasion y de segunda mano ha de contar con atributos para
# almacenar el numero de identificacion, el fabricante, el año de fabricacion (entre 1900 y 2022),
# el modelo, las millas por galon, y el precio en euros del vehıculo. Tambien se debe representar el
# conjunto de propietarios que ha tenido del vehıculo con un numero de telefono y un nombre.
# Describe la jerarquía de clases y estructura de directorio.

class Coche
  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :millas_galon, :precio, :propietarios
  
  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios)
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
  end

  def to_s 
    "Coche #{@id} #{@fabricante} #{@year_fabricacion} #{@modelo} #{@millas_galon} #{@precio} #{@propietarios}"
  end
end