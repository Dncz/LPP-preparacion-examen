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

  def <=>(other)
    @year_fabricacion <=> other
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

def promedio_precio(conjuntoObj, limit)
  @promedio_filtrado = conjuntoObj.select { |obj| obj <= limit } 
  # puts @promedio_filtrado.inspect
end


RSpec.describe Coche do
  describe "coche" do
    context "testing functions" do
      before :all do
        @coche1 = Coche.new(1111, "Toyota", 2018, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
        @coche2 = Coche.new(2222, "Honda", 2009, "Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche3 = Coche.new(3333, "Toyota", 2021, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @coche4 = Coche.new(4444, "Ford", 2022, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
        @coche5 = Coche.new(5555, "Honda", 2010, "Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche6 = Coche.new(6666, "Toyota", 2009, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @parking = [@coche1, @coche2, @coche3, @coche4, @coche5, @coche6]
      end

      it "Se espera el promedio de los precios dado un limite" do
        expect(promedio_precio(@parking, 2010)).to eq([@coche2, @coche5, @coche6])
        expect(promedio_precio([4, 3, 2, 1], 3)).to eq([3, 2, 1])
      end
    end
  end
end