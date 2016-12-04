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
end
