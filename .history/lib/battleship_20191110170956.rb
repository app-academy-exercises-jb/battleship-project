require_relative "board"
require_relative "player"

class Battleship
    attr_reader board, player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length*length)
        @remaining_misses = board.size/2
    end

    def start_game
        board.place_random_ships
        p board.num_ships
        p Board.print(board)
    end

    def lose?
        if @remaining_misses <= 0 
            p "you lose"
            true
        else
            false
        end
    end

    def win?
        if board.num_ships <= 0
            p "you win"
            true
        else
            false
        end
    end

    def game_over?
        win? || lose? ? true : false
    end

    def turn
        board.attack(player.get_move) ? nil : @remaining_misses 
        Board.print(board)
        p @remaining_misses
    end
end