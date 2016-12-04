# $LOAD_PATH << '.'
# require 'mod'
require_relative 'mod'

class User
  include Mod
  extend Mod

  def self.whole_name(first, last)
    string = "#{first} #{last}"
    all_caps(string)
  end

  def backwards_name(first, last)
    string = "#{first} #{last}"
    back_it_up(string)
  end

  def alpha(first, last)
    string = first + last
    alphebatize(string)
  end

  def loser(first, last)
    string = "#{first} #{last}"
    "#{string} is a vassal of #{Mod::WORLD_EMPEROR}"
  end
end

class Sentence
  include Mod
  include BoxLabels

  def whisper(string)
    Mod.lower_case(string)
  end

  def yell(string)
    string.capitalize
  end
end



puts Mod.lower_case("HI THEREHAHAH there")
puts BoxLabels.small_font("OKAY OKAY")

puts User.whole_name("Jim", "Jones")
puts User.new.backwards_name("Jim", "Jones")
puts User.new.alpha("Jim", "Jones")

puts User.new.loser("Jim", "Jones")

puts User.all_caps("hi there")
puts User.new.all_caps("bye there")

puts Sentence.new.whisper("HEY... COME CLOSE I NEED TO TELL YOU SOMETHING...")

puts Sentence.new.yell("hey BOY, i'm gonna give you a whoopin!")
