class Ship
  attr_reader :name, :length, :position

  def initialize(name, length)
    @name = name
    @length = length
    @position = set_position
  end

  private

  def set_position
    position = %w[horizontal vertical]
    position[Random.rand(2)]
  end
end