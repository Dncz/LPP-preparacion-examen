# se pide crear una clase vehiculo que pueda registar los datos de un coche
# las funcionalidades que debe de tener esta clase es:
# - Insertar propietarios
# - Cambiar el valor de la ITV

# primero creamos la expectativa de que la clase existe
RSpec.describe DSLVehiculo do
  describe "DLS vehiculo" do
    before :all do
      @vehiculo1 = DSLVehiculo.new
    end

    it "Se espera que exista un vehiculo" do
      expect(@vehiculo1).not_to be(nil)
    end

  end
end

# como la expectativa falla, creamos la clase Vehiculo
class DSLVehiculo
end

# creamos las expectativas de los atributos
RSpec.describe DSLVehiculo do
  describe "DLS atributos" do
    # before :all do
    #   @vehiculo1 = DSLVehiculo.new("1234KNG", "itv-pass", {"persona1" => "654321"}, 2018)
    # end

    it "Se espera que se pueda registrar un propietario" do
      propietario1 = {"persona1" => "654321"}
      propietario2 = {"persona2" => "611111"}
      @vehiculo = DSLVehiculo.new("1234KNG", 2018) do
        registrar_propietarios propietario1
        registrar_propietarios propietario2
      end
      expect(@vehiculo.propietarios).to eq([{"persona1" => "654321"}, {"persona2" => "611111"}])
    end

  end
end

# como la expectativa falla, creamos el constrcturo y la funcion para registar propietarios
class DSLVehiculo
  attr_reader :mat, :itv, :propietarios, :year

  def initialize(matricula, year, &block)
    @mat = matricula
    @year = year
    @propietarios = []
    @itv = "itv-no pass"

    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval(&block)
      end
    end
  end

  def registrar_propietarios(propietario)
    registar_propietario = propietario
    @propietarios << registar_propietario
  end

end

# creamos las expectativas para cambiar el valor de la itv
RSpec.describe DSLVehiculo do
  describe "DLS atributos" do

    it "Se espera que se pueda registrar un propietario" do
      propietario1 = {"persona1" => "654321"}
      propietario2 = {"persona2" => "611111"}
      @vehiculo = DSLVehiculo.new("1234KNG", 2018) do
        registrar_propietarios propietario1
        registrar_propietarios propietario2
      end
      expect(@vehiculo.propietarios).to eq([{"persona1" => "654321"}, {"persona2" => "611111"}])
    end

    it "Se espera cambiar el valor de la itv" do
      itv_pass = "itv- pass"
      @vehiculo = DSLVehiculo.new("1234KNG", 2018) do
        cambiar_itv itv_pass
      end
    end

  end
end

# la expecativa fallara, por lo que cremaos la funcion necesaria para cambiar el valor de la itv
class DSLVehiculo
  attr_reader :mat, :itv, :propietarios, :year

  def initialize(matricula, year, &block)
    @mat = matricula
    @year = year
    @propietarios = []
    @itv = "itv-no pass"

    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval(&block)
      end
    end
  end

  def registrar_propietarios(propietario)
    registar_propietario = propietario
    @propietarios << registar_propietario
  end

  def cambiar_itv(itv_valor)
    itv_valor_to_change = itv_valor
    @itv = itv_valor_to_change
  end

end

# expectativa de herencia
RSpec.describe DSLVehiculo do
  describe "DLS atributos" do

    it "Se espera que se pueda registrar un propietario" do
      propietario1 = {"persona1" => "654321"}
      propietario2 = {"persona2" => "611111"}
      @vehiculo = DSLVehiculo.new("1234KNG", 2018) do
        registrar_propietarios propietario1
        registrar_propietarios propietario2
      end
      expect(@vehiculo.propietarios).to eq([{"persona1" => "654321"}, {"persona2" => "611111"}])
    end

    it "Se espera cambiar el valor de la itv" do
      itv_pass = "itv- pass"
      @vehiculo = DSLVehiculo.new("1234KNG", 2018) do
        cambiar_itv itv_pass
      end
    end

  end

  describe "Herencia" do
    before :all do
      @vehiculo = DSLVehiculo.new("1234KNG", 2018)
    end

    it "Se espera que una instancia de la clase DSLVehiculo sea de DSLVehiculo" do
      expect(@vehiculo).to be_an_instance_of DSLVehiculo
    end

    it "Se espera que una instancia de la clase DSLVehiculo sea de BasicObject" do
      expect(@vehiculo).to be_kind_of BasicObject
    end

    it "Se espera que una instancia de la clase DSLVehiculo sea de Object" do
      expect(@vehiculo).to be_kind_of Object
    end

    it "No se espera que una instancia de la clase DSLVehiculo sea de String" do
      expect(@vehiculo).not_to be_a String
    end

    it "No se espera que una isntancias de las clase DSLVehiculo sea de Numeric" do
      expect(@vehiculo).not_to be_a Numeric
    end

  end
end