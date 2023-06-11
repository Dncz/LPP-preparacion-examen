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
