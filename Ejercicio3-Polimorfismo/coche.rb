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
  # en la clase coche hay que hace una sobrecarga del operador +

  # ToDo: REHACER DE NUEVO LAS FUNCIONES PARA QUE SEAN POLIMORFICAS...

  # función de segundo orden para calcular el coche con mayor precio
  
  # sobrecarga del operador +
  def +(other)
    Coche.new(@id, @fabricante, @year_fabricacion, @modelo, @millas_galon, @precio + other.precio, @propietarios, @ventas)
  end

  def -(other)
    Coche.new(@id, @fabricante, @year_fabricacion, @modelo, @millas_galon, @precio - other.precio, @propietarios, @ventas)
  end

  # def <=>(other)
  #   @precio <=> other.precio
  # end
  # def max_value
  #   @precio
  # end
  # def incrementar_precio(arrayCoches)
  #   arrayCoches.collect { |coche| coche.precio + (Time.now.year - coche.year_fabricacion) }
  # end

  # def descrementar_precio(arrayCoches)
  #   arrayCoches.collect { |coche| coche.propietarios.length >= 3 ? coche.precio - (0.5 * coche.precio) : coche.precio }
  # end
end

# def incrementar_precio(conjuntoObj)
#   conjuntoObj.collect { |obj| obj.precio + (Time.now.year - obj.year_fabricacion) }
# end

# # calcular el máximo valor de un array
# def max_precio(array)
#   # array.max_by { |objeto| objeto.max_value }
#   array.max { |a, b| yield(a) <=> yield(b) }
# end