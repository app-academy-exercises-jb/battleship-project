class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        gets.chomp.split(" ")
    end
end


__END__

rspec ./spec/1_player_spec.rb:8 # Player PART 3 #get_move should print 'enter a position with coordinates separated with a space like `4 7`'
rspec ./spec/1_player_spec.rb:15 # Player PART 3 #get_move it should call gets.chomp to get input from the user
rspec ./spec/1_player_spec.rb:24 # Player PART 3 #get_move should return an array containing the player's two input numbers as integers