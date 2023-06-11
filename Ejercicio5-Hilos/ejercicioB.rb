# 
# TIPO B: Proveedor y consumidor
# La idea de este ejercicio es usar el wait y el signal
# 

# Imagina que tenemos un hilo que es un carnicero y otro que es un cliente
# Entonces escriba un programa que represente el flujo que el coarnicenro pone el producto
# en el escaparate y el cliente lo consume
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