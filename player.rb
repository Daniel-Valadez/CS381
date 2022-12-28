#Daniel Valadez, CS381, 11-4-22

require_relative "element"
require_relative "history"

#Superclass for each type of player 
class Player
    attr_reader :name, :history
    def initialize(name, history)
        @name = name
        @history = history 
    end

    def play()
        fail "This method should be overridden"
    end
end

#Globals 
$rocky = Rock.new("Rock")
$paper = Paper.new("Paper")
$scissors = Scissors.new("Scissors")
$lizard = Lizard.new("Lizard")
$spock = Spock.new("Spock")

class StupidBot < Player
    def play()
        @history.log_play($rocky)
        return $rocky 
    end
end

class RandomBot < Player
    def play()
        options = Hash.new
        options[1] = $rocky
        options[2] = $paper
        options[3] = $scissors
        options[4] = $lizard
        options[5] = $spock
        #Generates a random number that picks choice for us. 
        x = rand(1...6)
        #puts options[x]
        @history.log_play(options[x])
        return options[x]
    end
end

class IterativeBot < Player

    def play()
        if @history.plays.empty? 
            @history.log_play($rocky)
            return $rocky
        elsif @history.plays.last.name == $rocky.name
            @history.log_play($paper)
            return $paper
        elsif @history.plays.last.name == $paper.name
            history.log_play($scissors)
            return $scissors
        elsif @history.plays.last.name == $scissors.name
            history.log_play($lizard)
            return $lizard
        elsif @history.plays.last.name == $lizard.name 
            history.log_play($spock)
            return $spock
        elsif @history.plays.last.name == $spock.name
            @history.log_play($rocky)
            return $rocky 
        end

        #If this doesn't work again
        @history.log_play($rocky)
        return $rocky
    end
end


class LastPlayBot < Player
    def play()
        #@history.log_opponent_play(Rock)
        if @history.plays.empty?
            @history.log_play($rocky)
            return $rocky
        else 
            @history.log_play(@history.opponent_plays.last)
            return @history.opponent_plays.last
        end
    end
end

class Human < Player
    def menu()
        puts "(1) Rock"
        puts "(2) Paper"
        puts "(3) Scissors"
        puts "(4) Lizard"
        puts "(5) Spock"
        print "Enter your move: "

        return input = gets.chomp.to_i 
    end

    def play()
        #we need valid input first
        loop do
            @option = menu()

            #is our option within the range? 
            if ((1..5)) === @option
                break
            else
                puts "Invalid move - try again"
            end
        end

        if @option == 1 
            @history.log_play($rocky)
            return $rocky
        elsif @option == 2
            @history.log_play($paper)
            return $paper
        elsif @option == 3
            @history.log_play($scissors)
            return $scissors
        elsif @option == 4
            @history.log_play($lizard)
            return $lizard
        else
            @history.log_play($spock)
            return $spock
        end
    end
end



stupid = StupidBot.new('StupidBot', History.new)
res =  stupid.play()
=begin
iterative = IterativeBot.new("IterativeBot", History.new); 
res = iterative.play #Should give me a tie
last = LastPlayBot.new("L", History.new)
last.history.log_opponent_play(res.name)
res= iterative.play #Should give me a tie
last.history.log_opponent_play(res.name)

puts last.play.compare_to(res)



puts iterative.play.compare_to(stupid.play) #Should give me a tie
puts iterative.play.compare_to(stupid.play) #Should give me a tie
puts iterative.play.compare_to(stupid.play) #Should give me a tie
puts iterative.play.compare_to(stupid.play) #Should give me a tie

puts "This is the last play #{iterative.history.plays.last.name}"
=end


#puts last.play.compare_to(stupid.play)

#me = Human.new("Human", History.new)
#puts me.play.compare_to(res)