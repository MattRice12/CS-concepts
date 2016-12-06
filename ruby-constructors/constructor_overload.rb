class Circle
  attr_accessor :radius, :area

  def self.new_by_radius(*args)
    circle = allocate
    circle.init_radius(*args)
    circle
  end

  def self.new_by_area(*args)
    circle = allocate
    circle.init_area(*args)
    circle
  end

  def init_radius(_radius)
    @radius = _radius * 1.0
    @area = 3.14 * (@radius ** 2)
  end

  def init_area(_area)
    @area = _area * 1.0
    @radius = Math.sqrt(@area / 3.14)
  end
end

Circle.new_by_radius(10)
Circle.new_by_area(314)
