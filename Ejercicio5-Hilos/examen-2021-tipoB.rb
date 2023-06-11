# TIPO B: proveedor y cunsumidor

# En un mercadillo, un agricultor cosecha un producto y lo pone en un expositor. Un
# empleado recoge el producto del expositor y lo lleva al mostrador del cliente. Escriba el
# código Ruby que permita a dos hilos poner y retirar productos del expositor Describa su
# implementación.

# Primero: el empleado es quien espera por el producto.
# segundo: el cliente es quien espera al empleado por el producto.
# tercero: el agricultor pone el producto en el expositor

mutex = Mutex.new
cv = ConditionVariable.new
cv2 = ConditionVariable.new

@producto = false
@mostrador = false

empleado = Thread.new do
              mutex.synchronize do
                # codigo
                print "Empelado: Estoy esperando a que el producto esté en el expositor\n"
                cv.wait(mutex)
                print "Empelado: ya recogí el producto\n"
                @producto = false
                print "Empelado: ahora pongo el producto en el msotrador del cliente\n"
                @mostrador = true
                cv2.signal
              end
            end

agricultor = Thread.new do
                mutex.synchronize do
                  # codigo
                  print "Agricultor: coseché un producto, ahora lo pongo en el expositor\n"
                  @producto = true
                  cv.signal
                  print "Agricultor: Me voy\n"
                end
              end

cliente = Thread.new do
            mutex.synchronize do
              # codigo
              print "Cliente: Espero por el producto\n"
              cv2.wait(mutex)
              print "Cliente: Ya recogí el producto del mostrador\n"
              @mostrador = false
            end
          end

empleado.join
agricultor.join
cliente.join

print "Final\n"