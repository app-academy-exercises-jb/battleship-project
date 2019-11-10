require_relative "board"
require_relative "player"
require "byebug"

class Battleship

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships()
        p @board.num_ships
        p @board.print
    end

    def board
        @board
    end

    def player
        @player
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
        if @board.num_ships <= 0
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
        @board.attack(@player.get_move) ? nil : @remaining_misses 
        @board.print
        p @remaining_misses
    end
end