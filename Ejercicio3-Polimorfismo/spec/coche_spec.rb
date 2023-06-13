require "../coche.rb"

RSpec.describe Coche do
  describe "Coche" do

    context "Atributos de la clase Coche" do
      # creo los objetos que voy a usar en los test
      before :all do
        @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 2])
        @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @coches = [@coche1, @coche2, @coche3]
      end

      # it "Existe un coche" do
      #   expect(@coche1).not_to eq(nil)
      # end

      it "Existe un id para el coche" do
        expect(@coche1.id).to eq(1111)
      end

      # más expectativas para los atributos...

      it "Se obtiene una cadena con la información del coche" do
        expect(@coche2.to_s).to eq("Coche 1111 fabricante 2021 Mercedes-Clase Lamda 10 100000 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}")
      end

      # it "Se obtiene el maximo precio de un coche" do
      #   # expect(@coches.max_by { |coche| coche.precio }.precio).to eq(100000)
      #   expect(max_precio(@coches) { |obj| obj.max_value }.precio).to eq(100000)
      #   expect(max_precio([1,2,3,4])).to eq(4)
      #   # expect(@coche1.max_precio(@coches)).to eq(100000)
      # end

      # it "Se obtiene el volumen de ventas minimo" do
      #   # expect(@coche1.minVolumen(@coches)).to eq(2)
      #   expect(@coches.min_by {|coches| coches.volumenVentas }.volumenVentas).to eq(2)
      # end

      it "Se incrementa el precio de los coches" do
        @array = [1,2,3]
        expect(incrementar_precio(@coches, 0.5)).to eq([52638.5, 100000.5, 987.5])
        expect(incrementar_precio(@array, 1)).to eq([2, 3, 4])
      end

      it "Se descrementa el precio de los coches" do
        @array = [1,2,3]
        expect(descrementar_precio(@coches, 0.5)).to eq([52637.5, 99999.5, 986.5])
        expect(descrementar_precio(@array, 1)).to eq([0, 1, 2])
      end
    end

  end
end