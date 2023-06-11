# TIPO A son cuando se tiene que modificar una variable común entre hilos (sin que los hilos se comuniquen)

# Se pide realizar la suma de cada indicador (hay 4 indicadores) de los vehículos que hay en el parking
# mediante el uso de hilos.
# 
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