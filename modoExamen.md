# Ejercicio 1: Crear una clase
## Enunciado
La clase para representar coches de ocasion y de segunda mano ha de contar con atributos para
almacenar el numero de identificacion, el fabricante, el año de fabricacion (entre 1900 y 2022),
el modelo, las millas por galon, y el precio en euros del vehıculo. Tambien se debe representar el
conjunto de propietarios que ha tenido del vehıculo con un numero de telefono y un nombre.
Describe la jerarquía de clases y estructura de directorio.

## Solución

### Jerarquía de clases
```
├──BasicObject
│   ├──Object
│   │   ├──Coche
│   │   ├── Numeric
│   │   │   ├──Integer
│   │   │   ├──Float
│   │   ├──Hash
│   │   ├──Array
│   │   ├──String
│   │   ├──Symbol
│   │   ├──Test::Unit::TestCase # en caso de que se use test unitarias (?)
│   │   │   ├──Test_Coche

```


### Estructura de directorio
Usando test unitarias
```
.
├── README.md
├── lib
│   ├── coche.rb
├── test
│   ├── test_coche.rb
```
Usando TDD
```
.
├── README.md
├── lib
│   ├── coche.rb
├── spec
│   ├── coche_spec.rb
```

## Resolución paso a paso
### Test unitarias
Usando la metodología de test unitarias, primero creamos el código y luego probamos que funcione correctamente con las pruebas unitarias.

Creamos la clase coche en el fichero coche.rb
```ruby
class Coche
end
```

Creamos el fichero de pruebas test_coche.rb
```ruby
require 'test/unit'
require_relative '../lib/coche'

class TestCoche < Test::Unit::TestCase
  def test_coche_existe
    assert_equal(nil, Coche.new)
  end
end
```

Creamos los atributos de la clase coche y el constructor
```ruby
class Coche
  attr_accessor :id, :fabricante, :anio_fabricacion, :modelo, :millas_galon, :precio, :propietarios

  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios)
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
  end
end
```

Añadimos las pruebas unitarias para comprobar que los atributos se han creado correctamente
```ruby
require 'test/unit'
require_relative '../lib/coche'

class TestCoche < Test::Unit::TestCase
  def test_coche_existe
    assert_equal(nil, Coche.new)
  end

  def test_atributos_coche
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
    assert_equal(1111, @coche1.id)
    assert_equal("fabricante", @coche1.fabricante)
    assert_equal(2021, @coche1.year_fabricacion)
    assert_equal("Mercedes-Clase G", @coche1.modelo)
    assert_equal(10, @coche1.millas_galon)
    assert_equal(52638, @coche1.precio)
    assert_equal({"pepe" => "611123345", "lola" => "611123345"}, @coche1.propietarios)
  end
end
```

En la clase Coche, creamos el método to_s para mostrar la información de la clase
```ruby
class Coche
  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :millas_galon, :precio, :propietarios
  
  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios)
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
  end

  def to_s 
    "Coche #{@id} #{@fabricante} #{@year_fabricacion} #{@modelo} #{@millas_galon} #{@precio} #{@propietarios}"
  end
end
```

Añadimos las pruebas unitarias para comprobar que el método to_s funciona correctamente
```ruby
require '../lib/coche.rb'
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
```

### TDD
Usando la metodología de TDD, primero creamos las expectativas y luego el código.

Creamos el fichero de pruebas coche_spec.rb
```ruby
require '../lib/coche.rb'

Rspec.describe coche do
  describe "clase coche" do
    it "existe la clase coche" do
      expect(Coche.new).to eq(nil)
    end
  end
end
```

Como la expectativa falla, creamos la clase coche en el fichero coche.rb
```ruby
class Coche
end
```

Añadimos las expectativas para comprobar que los atributos se han creado correctamente
```ruby
require '../lib/coche.rb'

Rspec.describe coche do
  describe "clase coche" do
    context "Atributos de la clase Coche" do
      before :all do
        @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
      end

      it "Existe la clase Coche" do
        expect(@coche1).to_not eq(nil)
      end

      it  "Existe una tributo para el id" do
        expect(@coche1.id).to eq(1111)
      end

      # más expectativas para los atributos...

    end
  end
end
```

Las expectativas fallan, por lo que creamos los atributos de la clase coche y el constructor
```ruby
class Coche
  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :millas_galon, :precio, :propietarios
  
  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios)
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
  end
end
```

Añadimos las expectativas para comprobar que el método to_s funciona correctamente
```ruby
require '../lib/coche.rb'

Rspec.describe coche do
  describe "clase coche" do
    context "Atributos de la clase Coche" do
      before :all do
        @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"})
      end

      it "Existe la clase Coche" do
        expect(@coche1).to_not eq(nil)
      end

      it  "Existe una tributo para el id" do
        expect(@coche1.id).to eq(1111)
      end

      # más expectativas para los atributos...

      it "Se obtiene una cadena con la información del coche" do
        expect(@coche1.to_s).to eq("Coche 1111 fabricante 2021 Mercedes-Clase G 10 52638 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}")
      end
    end
  end
end
```

La expectativa falla, por lo que creamos el método to_s para mostrar la información de la clase
```ruby
class Coche
  attr_reader :id, :fabricante, :year_fabricacion, :modelo, :millas_galon, :precio, :propietarios
  
  def initialize(id, fabricante, year_fabricacion, modelo, millas_galon, precio, propietarios)
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
  end

  def to_s 
    "Coche #{@id} #{@fabricante} #{@year_fabricacion} #{@modelo} #{@millas_galon} #{@precio} #{@propietarios}"
  end
end
```


# Ejercicio 2: Funciones de orden superior
En este tipo de ejercicio, se debe de crear las funciones fuera de la clase o en los test
## Enunciado
La clase coche, se quiere obtener
- el coche con el máxico precio de un conjunto de coches
- el minimo de volumen de ventas de un conjunto de coches
- incremente los precios de los coches cuyo factor de incremento es la diferencia entre el año actual y el año de fabricación
- Descrementar los precios de los coches en un factor de 0.5 si el coche tiene más de 3 propietarios


## Solución
Se crea una función de orden superior que recibe un array de coches, así mismo, vemos que no se generará efectos laterales, ya que no se modifica el array de entrada. Para lograr esto, se usa métodos del módulo Enumerable.

```ruby
  # función de segundo orden para calcular el coche con mayor precio
  def max_precio(arrayCoches)
    return arrayCoches.max_by { |coche| coche.precio }.precio
  end

  # función de segundo orden para calcular el volumen de ventas minimo
  def minVolumen(arrayCoches)
    arrayCoches.min_by { |coche| coche.volumenVentas }.volumenVentas
  end
```

# test unitarios
Se crea el test unitario para comprobar que la función de orden superior funciona correctamente
```ruby
require '../lib/coche.rb'
require 'test/unit'

class cocheTest < Test::Unit::TestCase
  # Los demás tests...
  # [code]

  def test_max_precio_coche
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]

    # test de la función de orden superior creada
    assert_equal(100000, max_precio(@coches))
  end

  def test_min_volumen_ventas
    @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
    @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
    @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
    @coches = [@coche1, @coche2, @coche3]

    # test de la función de orden superior
    assert_equal(2, @coches.min_by { |coches| coches.volumenVentas}.volumenVentas)
  end
end
```

# TDD
En el caso de la metodología TDD, primero se crean las expectativas y luego el código.

Se crea el fichero de pruebas coche_spec.rb
```ruby
require '../lib/coche.rb'

Rspec.describe coche do
  describe "clase coche" do
    context "Atributos de la clase Coche" do
      before :all do
        @coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
        @coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @coches = [@coche1, @coche2, @coche3]
      end

      it "Existe la clase Coche" do
        expect(@coche1).to_not eq(nil)
      end

      it  "Existe una tributo para el id" do
        expect(@coche1.id).to eq(1111)
      end

      # más expectativas para los atributos...

      it "Se obtiene una cadena con la información del coche" do
        expect(@coche1.to_s).to eq("Coche 1111 fabricante 2021 Mercedes-Clase G 10 52638 {\"pepe\"=>\"611123345\", \"lola\"=>\"611123345\"}")
      end

      it "Se obtiene el maximo precio de un coche" do
        expect(@coches.max_by { |coche| coche.precio }.precio).to eq(100000)
        expect(max_precio(@coches)).to eq(100000)
      end

      it "Se obtiene el volumen de ventas minimo" do
        expect(@coches.min_by {|coches| coches.volumenVentas }.volumenVentas).to eq(2)
      end

      it "Incrementar los precios de los coches cuyo factor de incremento es la diferencias entre el año" do
        expect(@coches.collect { |coche| coche.precio + (Time.now.year - coche.year_fabricacion) } ).to eq ([52640, 100002, 989])
      end

      it "Descrementar los precios de los coches en un factor de 0.5 si el coche tiene más de 3 propietarios" do
        expect(@coches.collect { |coche| coche.propietarios.length >=3 ? coche.precio - (coche.precio * 0.5) : coche.precio }).to eq([52638, 100000, 987])
      end

    end
  end
end
```

Como las expectativas fallan, se crea el código para que pasen las pruebas (no es necesario si ya las funciones se prueban en los test)
```ruby
class Coche
  include Enumerable

  # code...

  # función de segundo orden para calcular el coche con mayor precio
  def max_precio(arrayCoches)
    return arrayCoches.max_by { |coche| coche.precio }.precio
  end

  # función de segundo orden para calcular el volumen de ventas minimo
  def minVolumen(arrayCoches)
    arrayCoches.min_by { |coche| coche.volumenVentas }.volumenVentas
  end

end
```

# Ejercicio 3: Polimorfismo
En este ejercicio se pide crear una función polimórfica que calcule ciertas operaciones sobre un conjunto de objetos de diferentes tipos.

## Enunciado
Un aparcameinto es un conjunto de Vehículos (coches), usando UnitTest y TDD, con el uso del polimorfismo, se quiere obtener:
- Incrementar el precio de los coches de tal forma que el factor de incremento sea la diferencia entre el año actual y el año de fabricación del coche.
- Descrementar el precio de los coches en un factor de 0.5 si el coche tiene más de 3 propietarios.

Usando programación funcional, describa su implementacion.
## Usando TDD
Para la metodología TDD, primero se crean las expectativas y luego el código.

Se crea el fichero de pruebas coche_spec.rb
```ruby
require '../lib/coche.rb'

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

      # demás expectarivas...

      it "Se incrementa el precio de los coches" do
        expect(@coche1.incrementar_precio(@coches)).to eq([52640, 100002, 989])
      end

      it "Se descrementa el precio de los coches" do
        expect(@coche1.descrementar_precio(@coches)).to eq([26319, 100000, 987])
      end
    end

  end
end
```

Como las expectativas fallan, se crea el código para que pasen las pruebas
```ruby
class Coche
  include Enumerable
  # include Comparable
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
  
  # otros métodos...

  def incrementar_precio(arrayCoches)
    arrayCoches.collect { |coche| coche.precio + (Time.now.year - coche.year_fabricacion) }
  end

  def descrementar_precio(arrayCoches)
    arrayCoches.collect { |coche| coche.propietarios.length >= 3 ? coche.precio - (0.5 * coche.precio) : coche.precio }
  end
end
```

# Ejercicio 4: DSL
## Enunciado
Se quiere crear una clase AparcamientoDSL que permita registrar un parking, así como añadir el nombre e id del parking. se debe usar TDD.

## Usando TDD
Usando la clase Coche, creamos el fichero de pruebas aparcamiento_spec.rb.
Primero comprobamos que la clase AparcamientoDSL existe.
```ruby
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

  end
end
```
Como la expectativa falla, creamos el código para que pase la prueba.
```ruby
# Crea una clase DSL de coche

class AparcamientoDSL
end

```

Se espera que se pueda registar un parking, para ello, creamos la expectativa y luego, en la clase AparcamientoDSL creamos el constructor y la función para registrar un parking.
```ruby
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

  end
end
```
En la clase AparcamientoDSL.
```ruby
# Crea una clase DSL de coche

class AparcamientoDSL
  attr_reader :id, :nombre, :parkings

  # constructor de la clase DSL
  def initialize(&block)
    @parkings = []

    if block_given?
      if block.arity == 1
        yield self
      else
      instance_eval(&block)
      end
    end
  end

  # método para registar parking
  def registar_parking(parking)
    regist_parking = parking
    @parkings << regist_parking
  end

end

```

Creamos la expectativa para añadir el nombre e id del parking.
```ruby
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

  end
end
```	

En la clase AparcamientoDSL.
```ruby
# Crea una clase DSL de coche

class AparcamientoDSL
  attr_reader :id, :nombre, :parkings

  # constructor de la clase DSL
  def initialize(&block)
    @parkings = []

    if block_given?
      if block.arity == 1
        yield self
      else
      instance_eval(&block)
      end
    end
  end

  # método para registar parking
  def registar_parking(parking)
    regist_parking = parking
    @parkings << regist_parking
  end

  # método para poner un id al parking
  def id_parking(id_parking)
    @id = id_parking
  end

end

```

Creamos la expectativa para añadir el nombre del parking.
```ruby
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
```
En la clase AparcamientoDSL.
```ruby
# Crea una clase DSL de coche

class AparcamientoDSL
  attr_reader :id, :nombre, :parkings

  # constructor de la clase DSL
  def initialize(&block)
    @parkings = []

    if block_given?
      if block.arity == 1
        yield self
      else
      instance_eval(&block)
      end
    end
  end

  # método para registar parking
  def registar_parking(parking)
    regist_parking = parking
    @parkings << regist_parking
  end

  # método para poner un id al parking
  def id_parking(id_parking)
    @id = id_parking
  end

  # método para poner un nombre al parking
  def nombre_parking(nombre_parking)
    @nombre = nombre_parking
  end

  # método para informar del aparcamiento
  def to_s
    puts "#{@id}, #{@nombre}, #{@parkings.except}"
  end

end

```

# Ejericio 5: Hilos
En este tipo de ejercicio se peude pedir:
- Crear hilos en la que sea de tipo **"consumidor-proveedor"**
- Crear hilos en la que sea de tipo **Calcular algo**

## Consumidor-proveedor
Escriba un programa que represente el flujo que el carnicenro pone el producto en el escaparate y el cliente lo consume

```ruby
# 
# TIPO B: Proveedor y consumidor
# La idea de este ejercicio es usar el wait y el signal
# 
# Variable comun: un booleano o entero
# El hilo del carnicero incrementa el valor de la variable comun o lo pone a true
# El hilo del cliente decrementa el valor de la variable comun o lo pone a false
# El wait lo hace el cliente
# el signal lo hace el carnicero
# 

mutex = Mutex.new
cv = ConditionVariable.new

@producto = false

cliente = Thread.new do
            #codigo
            mutex.synchronize do
              #codigo
              print "Cliente: Esperando a que el carnicero ponga el producto\n"
              cv.wait(mutex)
              print "Cliente: El carnicero ha puesto el producto. Lo cojo\n"
              @producto = false
            end
          end

carnicero = Thread.new do
              #codigo
              mutex.synchronize do
                #codigo
                print "Carnicero: Pone el producto en el escaparate\n"
                @producto = true
                cv.signal
                puts "Carnicero: Se va"
              end
            end

cliente.join
carnicero.join

print "Al final\n"
```

## Calcular algo
Se pide realizar la suma de cada indicador (hay 4 indicadores) de los vehículos que hay en el parking mediante el uso de hilos.

```ruby
# TIPO A son cuando se tiene que modificar una variable común entre hilos (sin que los hilos se comuniquen)
 
require "./coche.rb"

mutex = Mutex.new             # esto es para indicar que el código que está
                              # entre mutex.synchronize do y end, es una región crítica
cv = ConditionVariable.new    # esto es para que los hilos se comuniquen entre ellos

@indicadorA = 0
@indicadorB = 0
@indicadorC = 0
@indicadorD = 0

@coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 1, 1, 1])
@coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 100000, {"pepe" => "611123345", "lola" => "611123345"}, [2, 2, 2, 2])
@coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 4, 5, 6])

@parking = [@coche1, @coche2, @coche3]

# hilos
hiloIndicadorA = Thread.new do
                    mutex.synchronize do
                      # code
                      @parking.each do |coche|
                        @indicadorA += coche.indicadores[0]
                      end
                    end

                  end

hiloIndicadorB = Thread.new do
                  mutex.synchronize do
                    # code
                    @parking.each do |coche|
                      @indicadorB += coche.indicadores[1]
                    end
                  end

                end

hiloIndicadorC = Thread.new do
                  mutex.synchronize do
                    # code
                    @parking.each do |coche|
                      @indicadorC += coche.indicadores[2]
                    end
                  end

                end

hiloIndicadorD = Thread.new do
                  mutex.synchronize do
                    # code
                    @parking.each do |coche|
                      @indicadorD += coche.indicadores[3]
                    end
                  end

                end

hiloIndicadorA.join
hiloIndicadorB.join
hiloIndicadorC.join
hiloIndicadorD.join

print "Indicador A: #{@indicadorA}\n"
print "Indicador B: #{@indicadorB}\n"
print "Indicador C: #{@indicadorC}\n"
print "Indicador D: #{@indicadorD}\n"
```
