
# usando Test unitaria

# Creamos la clase
class Moto
end

# Creamos el test unitario
# require '.moto.rb'
require 'test/unit'

class TestMoto < Test::Unit::TestCase
  def test_moto_existe
    assert_not_equal(nil, Moto.new())
  end
end

# creamos el constructor de la clase

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

# Creamos lps test para probar los atributos
require 'test/unit'

class TestMoto < Test::Unit::TestCase
  def test_moto_existe
    assert_not_equal(nil, Moto.new("1234KNG", "gasoil", {"marta" => "123456"}, 5000, 2013, true))
  end
  
  def test_atributos_moto_existe
    @moto = Moto.new("1234KNG", "gasoil", {"marta" => "123456"}, 5000, 2013, true)
    assert_equal("1234KNG", @moto.matricula)
    assert_equal("gasoil", @moto.combustible)
    assert_equal({"marta" => "123456"}, @moto.propietarios)
    assert_equal(5000, @moto.precio)
    assert_equal(2013, @moto.year_fabricacion)
    assert_equal(true, @moto.itv)
  end

end

# creamos el método to_s en la clase Moto
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

# Creamos lps test para probar los atributos
require 'test/unit'

class TestMoto < Test::Unit::TestCase
  def test_moto_existe
    assert_not_equal(nil, Moto.new("1234KNG", "gasoil", {"marta" => "123456"}, 5000, 2013, true))
  end
  
  def test_atributos_moto_existe
    @moto = Moto.new("1234KNG", "gasoil", {"marta" => "123456"}, 5000, 2013, true)
    assert_equal("1234KNG", @moto.matricula)
    assert_equal("gasoil", @moto.combustible)
    assert_equal({"marta" => "123456"}, @moto.propietarios)
    assert_equal(5000, @moto.precio)
    assert_equal(2013, @moto.year_fabricacion)
    assert_equal(true, @moto.itv)
  end

  def test_to_s
    @moto = Moto.new("1234KNG", "gasoil", {"marta" => "123456"}, 5000, 2013, true)
    assert_equal("Matricula: 1234KNG, combustible: gasoil, propietarios: {\"marta\"=>\"123456\"}, precio: 5000, year_fabricacion: 2013, itv: true", @moto.to_s)
  end

end