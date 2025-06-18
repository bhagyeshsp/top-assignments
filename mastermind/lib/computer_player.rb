# This is computer player class
class ComputerPlayer
  include Intelligence
  attr_accessor :name

  def initialize
    @name = %w[computron dave tars jarvis].sample
    puts "Created @name!\n"
  end

  def make_guess
    guess = (1..6).to_a.sample(4)
    puts "#{@name} guessed #{guess}\n\n"
    guess
  end
end
