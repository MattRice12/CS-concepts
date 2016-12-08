class User
  attr_accessor :name, :affect

  def initialize(name:, affect: affect = "Happy")
    @name = name
    @affect = affect
  end

  def everything
    @name + @affect
  end
end

user = User.new(name: "Matt")

user.everything
