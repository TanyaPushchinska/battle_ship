require './ship.rb'

def ask_user(string)
  puts string
  gets.chomp
end

def create_ships
  all_ships = ['Four-deck', 'Three-deck', 'Three-deck', 'Double deck', 'Double deck', 'Double deck', 'Single deck',
               'Single deck', 'Single deck', 'Single deck']
  ships = []

  all_ships.each_with_index do |name, length|
    case name
    when 'Four-deck'
      length = 4
    when 'Three-deck'
      length = 3
    when 'Double deck'
      length = 2
    when 'Single deck'
      length = 1
    end
    ships.push(Ship.new(name, length))
  end
  ships
end

def create_field
  field = Array.new(12) { Array.new(12) }

  12.times do |y|
    12.times do |x|
      field[y][x] = '.'
    end
  end
  field
end