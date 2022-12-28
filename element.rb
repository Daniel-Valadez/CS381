#Daniel Valadez, CS381, 11-4-22
#Superclass for playable moves
class Element 
    attr_accessor :name

    #constructor...
    def initialize(name)
        #@ for instance, $ global, @@ class variable
        @name = name 
    end

    #Going to override this
    def compare_to(element)
        fail "This method should be overridden"
    end
end 

#Rock beats scissors and lizard
#Loses to spock and paper
class Rock < Element
    def compare_to(element)
        #puts "Rock beats scissors" if element.name == "Scissors"
        case element.name
        when "Scissors" then return "Rock crushes Scissors", "Win"
        when "Lizard" then return "Rock crushes Lizard", "Win"
        when "Spock" then return "Spock vaporizes Rock", "Lose"
        when "Paper" then return "Paper covers Rock", "Lose"
        else 
            return "Rock equals Rock", "Tie"
        end
    end
end

#Beats rock and spock
#loses to scissors and lizard
class Paper < Element
    def compare_to(element)
        case element.name
        when "Rock" then return "Paper covers rock", "Win"
        when "Spock" then return "Paper disproves Spock", "Win"
        when "Scissors" then return "Scissors cut Paper", "Lose"
        when "Lizard" then return "Lizard eats Paper", "Lose"
        else
            return "Paper equals Paper", "Tie"
        end
    end
end

#Beats paper and lizard
#loses to rock and spock
class Scissors < Element
    def compare_to(element)
        case element.name
        when "Paper" then return "Scissors cut Paper", "Win"
        when "Lizard" then return "Scissors decapitate Lizard", "Win"
        when "Rock" then return "Rock crushes Scissors", "Lose"
        when "Spock" then return "Spock smashes Scissors", "Lose"
        else
            return "Scissors equals Scissors", "Tie"
        end
    end
end

#beats spock and paper
#loses to rock and scissors
class Lizard < Element 
    def compare_to(element)
        case element.name
        when "Paper" then return "Lizard eats Paper", "Win"
        when "Spock" then return "Lizard poisons Spock", "Win"
        when "Scissors" then return "Scissors decapitate Lizard", "Lose"
        when "Rock" then return "Rock crushes Lizard", "Lose"
        else
            return "Lizard equals Lizard", "Tie"
        end
    end
end

#Beats scissors and rock
#loses to lizard and paper
class Spock < Element
    def compare_to(element)
        case element.name
        when "Rock" then return "Spock vaporizes Rock", "Win"
        when "Scissors" then return "Spock smashes Scissors", "Win"
        when "Paper" then return "Paper disproves Spock", "Lose"
        when "Lizard" then return "Lizard poisons Spock", "Lose"
        else
            return "Spock equals Spock", "Tie"
        end
    end
end

my_rock = Rock.new("Rock")
my_scissors = Scissors.new("Scissors")
spock = Spock.new("Spock")
paper = Paper.new("Paper")
lizard = Lizard.new("Lizard")

#puts my_rock.compare_to(my_scissors)
#puts paper.compare_to(spock)
#puts lizard.compare_to(my_scissors)
