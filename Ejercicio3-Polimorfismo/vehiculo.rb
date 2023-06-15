
# Creamos una clase para probar la función de orden superior
class Vehiculo
  # include Comparable

  attr_reader :mat, :precio, :indicadores, :combustible

  def initialize(mat, precio, indicadores, combustible)
    @mat = mat
    @precio = precio
    @indicadores = indicadores
    @combustible = combustible
  end
  
  # def <=> (other)
  #   @indicadores.max <=> ohter.indicadores.max
  # end
  def +(other)
    @precio += other
  end

  def to_s
    "mat: #{@mat}, indicadores: #{@indicadores}"
  end

  def <=>(other)
    @indicadores.max <=> other.indicadores.max
  end

end

# se pide crear una función de orden superior que:
# - de un conjunto de vehiculos, devuelve el objeto con el máximo indicador del conjunto
# - incrementar el precio de los vehiculos del parking

def max_indicadores(array)
  # array.max { |obj1, obj2| obj1 <=> obj2 }
  array.max_by { |obj| obj }
end

# incrementar en un factor al precio vehiculos de un parking
def incrementar_precio(conjuntoVehiculo, factor)
  conjuntoVehiculo.collect { |vehiculo| vehiculo.precio + factor }
end

def promedio_precio(conjuntoVehiculo, limit)

end


RSpec.describe Vehiculo do
  describe "Test Vehiculo" do
    context "Testing de vehiculos" do
      before :all do
        @vehiculo1 = Vehiculo.new("1234KNG", 3000, [4, 3, 2, 1], "gasolina")
        @vehiculo2 = Vehiculo.new("1234KNG", 2000, [12, 7, 9, 2], "gasolina")
        @vehiculo3 = Vehiculo.new("1234KNG", 1000, [10, 3, 88, 11], "gasolina")
        @parking = [@vehiculo1, @vehiculo2, @vehiculo3]
      end
      it "Se espera que se calcule el máximo indicador del conjunto de vehiculos" do
        expect(max_indicadores(@parking)).to eq(@vehiculo3)
        expect(max_indicadores([4, 3, 2, 1])).to eq(4)
      end

      it "Se espera que se calcule el incremento de los precios de los vehiculos" do
        expect(incrementar_precio(@parking, 1)).to eq([3001, 2001, 1001])
      end

    end
  end
end