# $LOAD_PATH << '.'
# require 'mod'
require_relative 'mod'

class User
  # include Mod
  # extend Mod

  attr_accessor :first, :last

  def self.whole_name(first, last)
    string = "#{first} #{last}"
    Mod.all_caps(string)
  end

  def backwards_name(first, last)
    string = "#{first} #{last}"
    Mod.back_it_up(string)
  end

  def alpha(first, last)
    string = first + last
    Mod.alphebatize(string)
  end

  def loser(first, last)
    string = "#{first} #{last}"
    "#{string} is a vassal of #{Mod::WORLD_EMPEROR}"
  end
end


puts User.whole_name("Jim", "Jones")
puts User.new.backwards_name("Jim", "Jones")
puts User.new.alpha("Jim", "Jones")
puts User.new.loser("Jim", "Jones")
