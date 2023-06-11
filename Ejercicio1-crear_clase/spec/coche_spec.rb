require "../coche.rb"

RSpec.describe Coche do
  describe "Coche" do

    context "Atributos de la clase Coche" do
      # creo los objetos que voy a usar en los test
      before :all do
        @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
      end

      it "Existe un coche" do
        expect(@coche1).not_to eq(nil)
      end

      it "Existe un id para el coche" do
        expect(@coche1.id).to eq(1111)
      end

      # más expectativas para los atributos...

      it "Se obtiene una cadena con la información del coche" do
        expect(@coche1.to_s).to eq("Coche 1111 fabricante 2021 Mercedes-Clase G 10 52638 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}")
      end
    end

  end
end