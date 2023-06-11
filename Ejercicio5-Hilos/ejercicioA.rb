# TIPO A (calcular algo)
# creo que no es necesario que haya comunicación entre los hilos

# Se tiene un parking en la que se pide calcular el promedio de precio de los vehículos estacionados
require './coche.rb'

mutex = Mutex.new
cv = ConditionVariable.new

@coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 1, 1, 1])
@coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 100000, {"pepe" => "611123345", "lola" => "611123345"}, [2, 2, 2, 2])
@coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 4, 5, 6])

@parking = [@coche1, @coche2, @coche3]
@promedioPrecio = 0

@promedioPrecioThread = Thread.new do
                          mutex.synchronize do
                            # codigo
                            @valorTotal = 0
                            @parking.each do |coche|
                              @valorTotal += coche.precio
                            end
                            puts @valorTotal
                            @promedioPrecio = @valorTotal / @parking.length.to_f                     
                          end
                        end

@promedioPrecioThread.join

print "El promedio total de los precios de los coches es: #{@promedioPrecio}\n"