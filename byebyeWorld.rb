require 'pry'

class Point
  include Comparable, Enumerable
  attr_reader :x, :y
  
  def initialize(x,y)
    @x, @y = x, y
    if defined?(@@number_of_points)
      @@number_of_points += 1
    else
      @@number_of_points = 1
    end
  end
  
  #metodos de instancia
  def *(value)
    Point.new(@x * value, @y * value)
  end
  
  def -@
    Point.new(-@x, -@y)
  end
  
  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end
  
  def to_s #invalidando 
    "( #{@x}, #{@y} )"
  end
  
  #metodo de clase
  def self.count
    @@number_of_points
  end
  
  #constante
  ORIGIN = Point.new(0,0)
  
  #definición del método del Mixin Comparable
  def <=>(other)
    #return nil unless other.instance_of? Point
    @x**2 + @y**2 <=> other.x**2 + other.y**2
  end

  #definición del operador de acceso
  def [] (index)
    case index
      when 0, -2 
        @x
      when 1, -1
        @y
      when :x, "x" 
        @x
      when :y, "y" 
        @y
      else
        nil
    end 
  end
  
  def each
    yield @x
    yield @y
  end
end

binding.pry

p = Point.new(1,2)
puts p[:x]
puts p[0]
puts p[-2]

p.each{|x| puts x}
puts p.max
puts p.min
puts p.include?1
puts p.map{|i| i*2}