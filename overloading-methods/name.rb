module A
  def combine(first, last)
    first + last
  end
end
class B
  include A
  def combine(first, last)
    if first.is_a?(String) || last.is_a?(String)
      "#{first} #{last}"
    else
      super
    end
  end
end
b = B.new
p b.combine("Matt", "Rice")
p b.combine(5, 7)
