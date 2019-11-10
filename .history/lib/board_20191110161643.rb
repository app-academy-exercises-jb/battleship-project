class Board
  attr_reader size
  
  def initialize(n)
    @grid = Array.new(n) { Array.new }
    @grid.each{ |sub| sub.each { |ele| ele = :N} }
    @size = @grid.length * @grid.length
  end

  def self.print_grid(grid)
    grid.each { |row| 
        print row.join(" ")
        puts
    }
  end

  def [](array)
    @grid[array[0]][array[1]]
  end

  def []=(array, value)
    @grid[array[0]][array[1]] = value
  end

  def num_ships
    @grid.flatten.select { |ele| ele == :S }.length
  end

  def attack(position)
    if grid[position] == :S
        grid[position] = :H
        p 'you sunk my battleship!'
        true
    else
        grid[position] = :X
        false
    end
  end

  def place_random_ships
    n = @grid.length
    (n/4).times { |idx| 
        @grid[rand(n)][rand(n)]
    }
  end

  def hidden_ships_grid
    @grid.map { |row|
        row.map { |position| 
            position = :N if position == :S
        }
    }
  end




end


__END__

rspec ./spec/0_board_spec.rb:195 # Board PART 2 ::print_grid should print each row of @grid so every element in a row is separated with a space
rspec ./spec/0_board_spec.rb:201 # Board PART 2 #cheat should call Board::print_grid with @grid as an arg
rspec ./spec/0_board_spec.rb:210 # Board PART 2 #print should call Board::print_grid with the #hidden_ships_grid as an arg