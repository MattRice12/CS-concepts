#Def: Key value pair arrangment

hash = {first: "Austin", middle: "Matthew", last: "Rice"}
hash[:first]
  #=> "Austin"
hash.fetch(:middle)
  #=> "Matthew"
hash.delete(:last)
  #=> "Rice"
hash
  #=> {first: "Austin", middle: "Matthew"}

hash[:prefix] = "Mr."
  #=> {:first=>"Austin", :middle=>"Matthew", :prefix=>"Mr."}

new_hash = hash.invert
  #=> {"Austin"=>:first, "Matthew"=>:middle, "Mr."=>:prefix}

hash_3 = hash.merge(new_hash)
  #=> {:first=>"Austin", :middle=>"Matthew", :prefix=>"Mr.", "Austin"=>:first, "Matthew"=>:middle, "Mr."=>:prefix}

hash.to_a
  #=> [[:first, "Austin"], [:middle, "Matthew"], [:prefix, "Mr."]]

hash.keys
  #=> [:first, :middle, :prefix]

hash.values
  #=> ["Austin", "Matthew", "Mr."]

#########################################

#Iterating over a hash

hash.each_key { |key| puts key }
hash.each_value { |value| puts value }

new_hash = hash.map { |key, value| "#{key} = #{value}" }
  #=> ["first = Austin", "middle = Matthew"]

#########################################

Hash[[[1, "a"], [2, "b"], [3, "c"]]]
#=> {1=>"a", 2=>"b", 3="c"}

Hash[[1, 2, 3, 4, 5,].map {|x| [x, x.to_s]}]
#=> {1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5"}


my_hash = {
  1 => "one",
  2 => "two",
  3 => "three"
}

arr = [1, 2, 3]

Hash[arr.map {|x| [x.to_s, my_hash[x]]}]

#########################################

# Forming URLs
{a: "foo", b: "bar", lat: "120.343", lon: "33.212"}.map {|a, b| "#{a}=#{b}"}.join("&")
#=> "a=foo&b=bar&lat=120.343&lon=33.212"
