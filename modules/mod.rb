module Mod
  WORLD_EMPEROR = "Lex Luthor"

  def all_caps(string)
    string.upcase
  end

  def back_it_up(string)
    string.reverse
  end

  def alphebatize(string)
    string.chars.sort.join
  end

  def Mod.lower_case(string)
    string.downcase
  end

  def yell(string)
    string.downcase
  end
end

module BoxLabels
  def self.small_font(string)
    Mod.lower_case(string)
  end

  def yell(string)
    string.upcase
  end
end
