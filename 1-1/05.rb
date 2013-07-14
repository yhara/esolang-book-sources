class Counter
  def initialize
    @value = 0
  end
  attr_reader :value

  def inc
    @value += 1
  end
end
