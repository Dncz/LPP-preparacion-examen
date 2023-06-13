require "../coche.rb"
require "../DSL-aparcamiento.rb"

RSpec.describe AparcamientoDSL do
  describe "Aparcamiento DSL" do
    # se crean las variables para las pruebas
    before :all do
      @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 1, 1, 1])
      @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 100000, {"pepe" => "611123345", "lola" => "611123345"}, [2, 2, 2, 2])
      @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 4, 5, 6])
      
      @parking1 = [@coche1, @coche2, @coche3]
      @parking2 = [@coche2, @coche3]

    end

    # expectativas
    it "Existe la clase coche" do
      @aparcamientoDSL = AparcamientoDSL.new()
      expect(@AparcamientoDSL).to eq(nil)
    end

    it "Existe un método para registar para crear un coche" do
      parking1 = @parking1
      parking2 = @parking2
      @aparcamientoDSL = AparcamientoDSL.new() do
        registar_parking parking1
        registar_parking parking2
      end
      expect(@aparcamientoDSL.parkings).to eq([@parking1, @parking2])
    end

    it "Existe un método para poner el id de un aparcamiento" do
      @aparcamientoDSL = AparcamientoDSL.new() do
        id_parking "1234567"
      end
      expect(@aparcamientoDSL.id).to eq("1234567")      
    end

    it "Existe un método para poner un nombre al parking" do
      @aparcamientoDSL = AparcamientoDSL.new() do
        nombre_parking "Parking Esit"
      end
      expect(@aparcamientoDSL.nombre).to eq("Parking Esit")
    end

  end
end