require "byebug"
class Board

  def initialize(n)
    @size = n*n
    @grid = Array.new(n) { Array.new(n) { |ele| ele = :N } }
  end

  def size
    @size
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
    debugger
    if @grid[position] == :S
        @grid[position] = :H
        p 'you sunk my battleship!'
        true
    else
        @grid[position] = :X
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

  def cheat
    Board.print_grid(@grid)
  end

  def print_grid
    Board.print_grid(@hidden_ships_grid)
  end
end

