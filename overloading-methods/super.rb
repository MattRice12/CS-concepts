class MathSuper
  def math
    p "Do the math"
  end
end

class MathChild < MathSuper
  def math(a, b)
    super
    p a + b
  end
end

b = MathChild.new
b.math(5, 2)
