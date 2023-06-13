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


  # notas de polimorfismo
  # una función polimórfica es aquella que puede recibir distintos tipos de datos
  # y funcionará de los tipos de datos que se pasen
  # Hay que hacer que las funciones polimorficas no usen los datos de la propia clase
  # a la funcion le paso el vector de coches
  
  # sobrecarga del operador +
  def +(other)
    # esto es para devolver un objeto con el precio incrementado
    # Coche.new(@id, @fabricante, @year_fabricacion, @modelo, @millas_galon, @precio + other, @propietarios, @ventas)
    @precio + other
  end

  def -(other)
    @precio - other
  end

  def max(other)
    
  end

end

# incremento del precio dado un factor
def incrementar_precio(conjuntoObj, factor)
  conjuntoObj.collect { |objeto| objeto + factor }
end

# descrementar el precio dado un factor
def descrementar_precio(conjuntoObj, factor)
  conjuntoObj.collect { |objeto| objeto - factor }
end
