# los test unitarios es:
# 1. Crear un objeto de la clase Coche
# 2. Comprobar que el objeto creado existe

# es tipo, 1- creo el código y despues el test
# en TDD: es tipo 1- creo el test (expectativas) y despues el código

require '../coche.rb'
require 'test/unit'

class CocheTest < Test::Unit::TestCase
  def test_coche_exists
    assert_not_equal(nil, Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}))
  end

  def test_atributos_coche_exists
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
    assert_equal(1111, @coche1.id)
    assert_equal("fabricante", @coche1.fabricante)
    assert_equal(2021, @coche1.year_fabricacion)
    assert_equal("Mercedes-Clase G", @coche1.modelo)
    assert_equal(10, @coche1.millas_galon)
    assert_equal(52638, @coche1.precio)
    assert_equal({"pepe" => "611123345", "lola" => "611123345"}, @coche1.propietarios)
  end

  def test_to_s_coche_exists
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
    assert_equal("Coche 1111 fabricante 2021 Mercedes-Clase G 10 52638 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}", @coche1.to_s)

  end

end