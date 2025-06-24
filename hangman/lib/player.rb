# This class contains player related details
class Player
  attr_reader :name

  def initialize
    @name = %w[carlo corleone michael tom].sample
  end
end
