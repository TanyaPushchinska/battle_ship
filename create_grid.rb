class CreateGrid
  attr_reader :ships, :field

  def initialize(ships, field)
    @ships = ships
    @field = field
  end

  def create_grid
    ships.each_with_index do |obj, _length|
      loop do
        x_pos = (1 + Random.rand(10))
        y_pos = (1 + Random.rand(10))
        if (obj.position == "vertical" && (x_pos + obj.length) <= 11)
          break if check_grid(x_pos, y_pos, obj)
        end
        if (obj.position == "horizontal" && (y_pos + obj.length) <= 11)
          break if check_grid(x_pos, y_pos, obj)
        end
      end
    end
  end

  def show_grid
    print "  "
    11.times do |x|
      print "#{x} " if x > 0
    end
    print "\n"
    1.upto(10) do |y|
      print "#{(y + 96).chr} "
      1.upto(10) do |x|
        print "#{field[y][x]} "
      end
      print "\n"
    end
  end


  def check_grid(x_p, y_p, obj)
    flag = true
    if (obj.position == "vertical")
      count = x = x_p - 1
      while x < (x_p + obj.length + 1)
        if (field[y_p][x] != "." || field[y_p + 1][x] != "." || field[y_p - 1][x] != ".")
          flag = false
          break
        end
        x += 1
      end
    end

    if (obj.position == "horizontal")
      count = y = y_p - 1
      while y < (y_p + obj.length + 1)
        if (field[y][x_p] != "." || field[y][x_p + 1] != "." || field[y][x_p - 1] != ".")
          flag = false
          break
        end
        y += 1
      end
    end
    set_ship(x_p, y_p, obj) if flag
    flag
  end

  def set_ship(x_pos, y_pos, obj)
    if obj.position == "vertical"
      obj.length.times do |x|
        field[y_pos][x_pos + x] = obj.length
      end
    elsif obj.position == "horizontal"
      obj.length.times do |y|
        field[y_pos + y][x_pos] = obj.length
      end
    end
  end
end
