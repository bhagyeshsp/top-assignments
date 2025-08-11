# This is player class
class Player
  attr_accessor :name, :sign, :victor

  def initialize(name)
    @name = name
    @victor = false
    @sign = ""
  end

  protected

  def declare_victory(name)
    name.victor = true
    "#{@name} has won!"
  end
end
