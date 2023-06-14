# 
# Tipo B: proveedor y consumidor
# 
# Un parking está formado por 5 plazas de estacionamiento y cada coche debe
# ser estacionado antes de poder salir. Cada coche cuenta con un lugar de
# estacionamiento asignado y solo puede usar el lugar asignado a su este y oeste.
# Si un coche solo tiene disponible un lugar de estacionamiento, debe esperar hasta
# que el otro lugar quede libre para poder estacionarse. Considera una implementación
# en el lenguaje de programación Ruby y describe los problemas que se presentan
# y cómo solucionarlos
# 

# la idea es: que un coche puede estacionar, si al lado del estacionameinto donde queire aparcar, están libres
# 
require './coche.rb'

mutex = Mutex.new
cv = ConditionVariable.new

@coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 1, 1, 1])
@coche2 = Coche.new(2222, "fabricante", 2021, "Mercedes-Clase Lamda", 100000, {"pepe" => "611123345", "lola" => "611123345"}, [2, 2, 2, 2])
@coche3 = Coche.new(3333, "fabricante", 2021, "Mercedes-Clase 0", 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 4, 5, 6])


@parking = [@coche1, false, @coche2, false, false]

def print_parking(parking)
  puts "[ "
  parking.each do |estacionamiento|
    puts estacionamiento.to_s
  end
  puts "]"
end

hiloCoche3 = Thread.new do
                mutex.synchronize do
                  print "Coche3: Estoy esperando por un sitio libre\n"
                  cv.wait(mutex)
                  print "Coche3: Estacionando...\n"
                  print_parking(@parking)
                  @parking.each_with_index do |estacionamiento, index|
                    if estacionamiento == false && index == 0 && @parking[index +1] == false
                      @parking[index] = @coche3
                      break
                    end
                    if estacionamiento == false && @parking[index +1] == false && @parking[index -1] == false
                      @parking[index] = @coche3
                      break
                    end
                    if estacionamiento == false && index == @parking.size - 1 && @parking[index -1] == false
                      @parking[index] = @coche3
                      break
                    end
                  end
                  print "Coche3: Aparcao\n"
                end
              end

hiloCoche1 = Thread.new do
                mutex.synchronize do
                  print "Coche1: Voy a salir...\n"
                  @parking.each_with_index do |estacionamiento, index|
                    if estacionamiento == @coche1
                      @parking[index] = false
                      break
                    end
                    print "Coche1:Coche no encontrado...\n"
                  end
                  cv.signal
                  print "Coche1: *Se va*\n"
                end
              end

hiloCoche3.join
hiloCoche1.join

print_parking(@parking)

print "Final\n"
