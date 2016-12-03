module Mod
  WORLD_EMPEROR = "Lex Luthor"

  def Mod.all_caps(string)
    string.upcase
  end

  def Mod.back_it_up(string)
    string.reverse
  end

  def Mod.alphebatize(string)
    string.chars.sort.join
  end
end
