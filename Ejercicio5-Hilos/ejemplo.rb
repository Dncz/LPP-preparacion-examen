mutex = Mutex.new
cv = ConditionVariable.new 

a = Thread.new do
      mutex.synchronize do  # esto indica que todo que está en la parte 5 a la 9, forma parte de una región crítica
        # eso se hace con la clase Mutex
        print "A: Esta en una region critica, esperando por cv\n"
        cv.wait(mutex)
        print "A: Esta en la region critica de nuevo!. Sigue\n"
      end 
    end

print "En medio\n"

b = Thread.new do 
      mutex.synchronize do 
        puts "B: Esta en la region critica pero tiene a cv"
        cv.signal
        puts "B: Esta en la region critica, Saliendo"
      end 
    end

a.join
b.join

print "Al final\n"

# notas de funciones de orden superior
# no es correcto poner la funcion de orden superior dentro de la clase
# se pone fuera de la clase o dentro de los test
# 
# notas de polimorfismo
# una función polimórfica es aquella que puede recibir distintos tipos de datos
# y funcionará de los tipos de datos que se pasen
# Hay que hacer que las funciones polimorficas no usen los datos de la propia clase
# a la funcion le paso el vector de coches
# en la clase coche hay que hace una sobrecarga del operador +
# 
# notas de DSL: es como la práctica
#