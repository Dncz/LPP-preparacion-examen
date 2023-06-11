# TIPO A

# Escribir en una pizarra los modelos de los coches
# que al sumar los indicadores, den mayor que 5
# Luego, borra el modelo de los coches que al sumar los indicadores, den menor que 10
require './coche.rb'

mutex = Mutex.new
cv = ConditionVariable.new
@coche1 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase G", 52638, {"pepe" => "611123345", "lola" => "611123345", "juan" => "677777777"}, [1, 1, 1, 1])
@coche2 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase Lamda", 100000, {"pepe" => "611123345", "lola" => "611123345"}, [2, 2, 2, 2])
@coche3 = Coche.new(1111, "fabricante", 2021, "Mercedes-Clase 0", 987, {"pepe" => "611123345", "lola" => "611123345"}, [3, 4, 5, 6])

@parking = [@coche1, @coche2, @coche3]

@pizarra = []
@indicadoresModelos = []

# hilos
a = Thread.new do
      mutex.synchronize do
        # codigo
        @parking.each do |coche|
          @sumaIndicadores = 0
          coche.indicadores.each do |indicador|
            @sumaIndicadores += indicador
          end
          if (@sumaIndicadores >= 5)
            print "Se inserta un modelo en la pizarra\n"
            puts "coche.modelo: #{coche.modelo}"
            @pizarra << coche.modelo
            @indicadoresModelos << @sumaIndicadores
          end
        end
      end
    end
    
b = Thread.new do
      mutex.synchronize do
        # codigo
        @indicadoresModelos.each do |indicador|
          if (indicador < 10)
            print "Se borra un modelo de la pizarra\n"
            puts "coche.modelo: #{@pizarra[@indicadoresModelos.index(indicador)]}"
            @pizarra.delete_at(@indicadoresModelos.index(indicador))
            @indicadoresModelos.delete_at(@indicadoresModelos.index(indicador))
          end
        end
      end
    end

a.join
b.join

print "Pizarra: #{@pizarra.inspect}\n"