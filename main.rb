require "./generation_methods.rb"
require "./create_grid.rb"

answer = ''
while answer != 'n'
  ships = create_ships
  field = create_field
  puts 'Your map:'
  grid = CreateGrid.new(ships, field)
  grid.create_grid
  grid.show_grid
  ships1 = create_ships
  field1 = create_field
  puts 'Map for your opponent:'
  grid1 = CreateGrid.new(ships1, field1)
  grid1.create_grid
  grid1.show_grid
  answer = ask_user('Make your move, please: | To exit, press (/n)')
end
