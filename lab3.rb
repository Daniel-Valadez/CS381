require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  Daniel Valadez					 	#
#  valadezd@oregonstate.edu	            #
#										#
#########################################
def game(rounds)

    #Hashing out the options... 
    options = Hash.new
    options[1] = StupidBot
    options[2] = RandomBot
    options[3] = IterativeBot
    options[4] = LastPlayBot
    options[5] = Human

    player1 = 0
    player2 = 0

    #menu
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n\n"	
    puts "Please choose two players:"
    puts "(1) StupidBot"
    puts "(2) RandomBot"
    puts "(3) IterativeBot"
    puts "(4) LastPlayBot"
    puts "(5) Human"
    loop do 
        print "Select player 1: "
        player1 = gets.chomp.to_i
        print "Select player 2: "
        player2 = gets.chomp.to_i 

        #Validate the input and repeat as necessary
        if((1..5) === player1) && ((1..5) === player2)
            break 
        else
            puts "Invalid choice(s) - start over\n\n"
        end
    end
    
    #We have valid input 
    puts "#{options[player1].name} vs. #{options[player2].name}\n\n"

    p1Bot = options[player1].new("Player1", History.new)
    p2Bot = options[player2].new("Player2", History.new); 
    #puts p1.name

    counter = 1; 

    #Or I can have a loop count upward itself with rounds as the argument
    while counter <= rounds
        puts "Round #{counter}: "

        p1Result = p1Bot.play 
        p2Result = p2Bot.play
        #p2Bot.history.opponent_plays.push(p1Result.name)
        #p1Bot.history.opponent_plays.push(p2Result.name)
        p2Bot.history.log_opponent_play(p1Result)
        p1Bot.history.log_opponent_play(p2Result)
        
        
        puts "Player 1 chose #{p1Result.name}"
        puts "Player 2 chose #{p2Result.name}"
        #puts "Opponent play: #{p1Bot.history.opponent_plays}"

        #Increment the counter so we can exit the loop

        #Choose a winner: 
        winner = p1Result.compare_to(p2Result)
        puts winner[0]

        
        if winner.include?('Win') == true
            p1Bot.history.add_score()
            puts "Player 1 won the round\n\n"
        elsif winner.include?('Lose') == true
            p2Bot.history.add_score() 
            puts "Player 2 won the round\n\n"
        else 
            puts "Round was a tie\n\n"
        end

        counter += 1 
    end

    puts "Final score is #{p1Bot.history.score} to #{p2Bot.history.score}"
    if p1Bot.history.score > p2Bot.history.score
        puts "Player 1 wins"
    elsif p2Bot.history.score > p1Bot.history.score
        puts "Player 2 wins"
    else
        puts "Game was a draw"
    end
end


# Main Program (should be last)

n_rounds = 5
# call to kick off the game
game(n_rounds)