# los test unitarios es:
# 1. Crear un objeto de la clase Coche
# 2. Comprobar que el objeto creado existe

# es tipo, 1- creo el código y despues el test
# en TDD: es tipo 1- creo el test (expectativas) y despues el código

require '../coche.rb'
require 'test/unit'

class CocheTest < Test::Unit::TestCase
  def test_coche_exists
    assert_not_equal(nil, Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2]))
  end

  def test_atributos_coche_exists
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    assert_equal(1111, @coche1.id)
    assert_equal("fabricante", @coche1.fabricante)
    assert_equal(2021, @coche1.year_fabricacion)
    assert_equal("Mercedes-Clase G", @coche1.modelo)
    assert_equal(10, @coche1.millas_galon)
    assert_equal(52638, @coche1.precio)
    assert_equal({"pepe" => "611123345", "lola" => "611123345"}, @coche1.propietarios)
  end

  def test_to_s_coche_exists
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    assert_equal("Coche 1111 fabricante 2021 Mercedes-Clase G 10 52638 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}", @coche1.to_s)
  end

  def test_max_precio_coche
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]
    # puts max_precio(@coches)
    assert_equal(100000, @coche1.max_precio(@coches))
  end

  def test_min_volumen_ventas
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]

    # assert_equal(2, @coche1.minVolumen(@coches))
    assert_equal(2, @coches.min_by { |coches| coches.volumenVentas}.volumenVentas)
  end

  def test_incremento_precio
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]
    assert_equal([52640, 100002, 989], @coche1.incrementar_precio(@coches))
  end

  def test_decremento_precio
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]
    assert_equal([26319, 100000, 987], @coche1.descrementar_precio(@coches))
  end

end