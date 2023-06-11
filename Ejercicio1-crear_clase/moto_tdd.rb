
# creamos las expectativas en un fichero moto_spec.rb
RSpec.describe Moto do
  describe "Moto" do
    context "Atributos de la clase Moto" do
      it "Exsite la clase Moto" do
        @moto = Moto.new
        expect(@moto).not_to be nil
      end
    end 
  end
end

# como la expectiva falla, se crea la clase Moto
class Moto
end

# creamos expectativas para los atributos
RSpec.describe Moto do
  describe "Moto" do
    context "Atributos de la clase Moto" do
      # creamos los objetos
      before :all do
        @moto = Moto.new("1234KNG", "gasolina", {"persona1" => "654321"}, 3000, 2005, false)
      end

      it "Exsite la clase Moto" do
        expect(@moto).not_to be nil
      end

      it "Existe la matricula" do
        expect(@moto.matricula).to eq("1234KNG")
      end
      
      # demás atributos...
      
    end 
  end
end

# como la expectativas fallan, se crea el cosntructor de Moto
class Moto
  attr_reader :matricula, :combustible, :propietarios, :precio, :year_fabricacion, :itv

  def initialize(matricula, combustible, propietarios, precio, year_fabricacion, itv)
    @matricula = matricula
    @combustible = combustible
    @propietarios = propietarios
    @precio = precio
    @year_fabricacion = year_fabricacion
    @itv = itv
  end
end

# creamos la expectativa para to_s
RSpec.describe Moto do
  describe "Moto" do
    context "Atributos de la clase Moto" do
      # creamos los objetos
      before :all do
        @moto = Moto.new("1234KNG", "gasolina", {"persona1" => "654321"}, 3000, 2005, false)
      end

      it "Exsite la clase Moto" do
        expect(@moto).not_to be nil
      end

      it "Existe la matricula" do
        expect(@moto.matricula).to eq("1234KNG")
      end
      
      # demás atributos...
      
      it "Existe una cadena de informacion sobre la moto" do
        expect(@moto.to_s).to eq("Matricula: 1234KNG, combustible: gasolina, propietarios: {\"persona1\"=>\"654321\"}, precio: 3000, year_fabricacion: 2005, itv: false")
      end

    end 
  end
end

# como la expectativa falla, se crea la función to_s en Moto
class Moto
  attr_reader :matricula, :combustible, :propietarios, :precio, :year_fabricacion, :itv

  def initialize(matricula, combustible, propietarios, precio, year_fabricacion, itv)
    @matricula = matricula
    @combustible = combustible
    @propietarios = propietarios
    @precio = precio
    @year_fabricacion = year_fabricacion
    @itv = itv
  end

  def to_s
    "Matricula: #{@matricula}, combustible: #{@combustible}, propietarios: #{@propietarios}, precio: #{@precio}, year_fabricacion: #{@year_fabricacion}, itv: #{@itv}"
  end

end

