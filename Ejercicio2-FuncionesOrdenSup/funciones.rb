require './coche.rb'
# require './vehiculo.rb'

# EJERCICIO 1
# Se requiere desarrollar una función de segundo orden en Ruby que, dado un conjunto de objetos Coche,
# calcule el promedio de los precios de todos los coches cuyo año de fabricación sea anterior a un año dado.
# La función debe utilizar métodos enumerables para realizar las operaciones sobre el conjunto de coches
# La función debe retornar el promedio de los precios de los coches que cumplan la condición
# Se debe usar TDD

# primero, creamos la expectativa de la función
# RSpec.describe TestCoche do
#   describe "TestCoche" do
#     context "Testing de promedio de precios" do
#       before :all do
#         @coche1 = Coche.new(1111, "fabricante", 2018, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche2 = Coche.new(1111, "fabricante", 2020, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @parking = [@coche1, @coche2, @coche3]
#       end

#       it "Se espera el promedio de los precios de los coches de un parking" do
#         @valorEsperado = 0
#         expect(promedio_precio(@parking, 2020)).to eq(@valoEsperado)
#       end
#     end
#   end
# end

# como las expectativas fallas, se crea la función de orden superior
def promedio_precios(conjCoche, year_limit)
  @precios_filtrados = conjCoche.select { |coche| coche.year_fabricacion <= year_limit }.collect(&:precio)
  @precios_filtrados.reduce(:+).to_f / @precios_filtrados.size
end

# vemos la expectativa...
# RSpec.describe Coche do
#   describe "TestCoche" do
#     context "Testing de promedio de precios" do
#       before :all do
#         @coche1 = Coche.new(1111, "fabricante", 2018, "Mercedes-Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche2 = Coche.new(1111, "fabricante", 2020, "Mercedes-Clase Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @parking = [@coche1, @coche2, @coche3]
#       end

#       it "Se espera el promedio de los precios de los coches de un parking" do
#         expect(promedio_precios(@parking, 2020)).to eq(76319.0)
#       end

#     end
#   end
# end



# EJERCICIO 2
# Se desea implementar una función de segundo orden en Ruby que, dada una lista de objetos Coche,
# calcule el número total de coches que tienen una marca específica y un año de fabricación posterior
# a un año determinado. La función debe utilizar métodos enumerables para realizar las operaciones
# sobre la lista de coches

def contar_coches(conjuntoCoche, marca, year_limit)
  @cochesMarca = conjuntoCoche.select { |coche| coche.fabricante == marca }.collect(&:year_fabricacion)
  @cochesCount = @cochesMarca.select { |year| year >= year_limit }.collect
  @cochesCount.count
end

# RSpec.describe Coche do
#   describe "TestCoche" do
#     context "Testing de promedio de precios" do
#       before :all do
#         @coche1 = Coche.new(1111, "Toyota", 2018, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche2 = Coche.new(2222, "Honda", 2009, "Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche3 = Coche.new(3333, "Toyota", 2021, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @coche4 = Coche.new(4444, "Ford", 2022, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche5 = Coche.new(5555, "Honda", 2010, "Lamda", 10, 100000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche6 = Coche.new(6666, "Toyota", 2009, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @parking = [@coche1, @coche2, @coche3, @coche4, @coche5, @coche6]
#       end

#       it "Se espera la cantidad de coches de una marca fabricados después de un año" do
#         expect(contar_coches(@parking, "Toyota", 2010)).to eq(2)
#       end

#     end
#   end
# end



# EJERCICIO 3
# Se te solicita implementar una función de segundo orden en Ruby que,
# dada una lista de objetos Coche, realice las siguientes operaciones utilizando métodos enumerables:
# 
# - Filtrar los coches cuyo precio esté dentro de un rango específico proporcionado como parámetro.
#   El rango incluye tanto el valor inicial como el valor final.
# - Calcular el promedio de los precios de los coches resultantes.
# 
# La función debe recibir cuatro parámetros: la lista de coches representada por un array,
# el valor inicial y final del rango de precios, y un booleano que indica si se debe calcular
# el promedio de todos los coches o solo de los que cumplen con el rango de precios.
# 
# La función debe retornar el promedio de los precios de los coches filtrados

def calcular_promedio_total(conjuntoCoche, valor_ini, valor_final, all_or_not)
  @rango_precios = conjuntoCoche.select { |coche| coche.precio >= valor_ini && coche.precio <= valor_final }.collect(&:precio)
  # print "Total #{@rango_precios.inspect}"
  promedio = 0
  if (!all_or_not)
    promedio = @rango_precios.reduce(:+) / @rango_precios.size
  else
    promedio = conjuntoCoche.select { |coche| coche.precio }.collect(&:precio).reduce(:+)
  end
  promedio.to_f
end

# RSpec.describe Coche do
#   describe "TestCoche" do
#     context "Testing de promedio de precios" do
#       before :all do
#         @coche1 = Coche.new(1111, "Toyota", 2018, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche2 = Coche.new(2222, "Honda", 2009, "Lamda", 10, 10000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche3 = Coche.new(3333, "Toyota", 2021, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @coche4 = Coche.new(4444, "Ford", 2022, "Clase G", 10, 12000, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
#         @coche5 = Coche.new(5555, "Honda", 2010, "Lamda", 10, 8000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
#         @coche6 = Coche.new(6666, "Toyota", 2009, "Clase 0", 10, 15000, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
#         @parking = [@coche1, @coche2, @coche3, @coche4, @coche5, @coche6]
#       end

#       it "Se espera el promedio de los precios de los coches que cumplen con el rango de precios" do
#         expect(calcular_promedio_total(@parking, 8000, 12000, false)).to eq(10000.0)
#       end

#     end
#   end
# end



# EJERCICIO 4
# Se requiere implementar una función en Ruby que, dado un arreglo de coches,
# encuentre el número máximo y mínimo precio y los retorne en un nuevo arreglo.
# La función debe utilizar métodos enumerables para realizar las operaciones.
# 

def encontrar_min_max_precio(conjuntoCoche)
  conjuntoCoche.minmax_by { |coche| coche.precio }.collect(&:precio)
end

RSpec.describe Coche do
  describe "TestCoche" do
    context "Testing de promedio de precios" do
      before :all do
        @coche1 = Coche.new(1111, "Toyota", 2018, "Clase G", 10, 52638, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
        @coche2 = Coche.new(2222, "Honda", 2009, "Lamda", 10, 10000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche3 = Coche.new(3333, "Toyota", 2021, "Clase 0", 10, 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @coche4 = Coche.new(4444, "Ford", 2022, "Clase G", 10, 12000, {"pepe" => "611123345", "lola" => "611123345"}, [1, 2])
        @coche5 = Coche.new(5555, "Honda", 2010, "Lamda", 10, 8000, {"pepe" => "611123345", "lola" => "611123345"}, [5, 1])
        @coche6 = Coche.new(6666, "Toyota", 2009, "Clase 0", 10, 15000, {"pepe" => "611123345", "lola" => "611123345"}, [3, 3])
        @parking = [@coche1, @coche2, @coche3, @coche4, @coche5, @coche6]
      end

      it "Se espera el mínimo y máximo de los precios del conjunto de coches" do
        expect(encontrar_min_max_precio(@parking)).to eq([987, 52638])
      end

    end
  end
end