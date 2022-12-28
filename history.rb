#Daniel Valadez, CS381, 11-4-22

class History
    attr_accessor :plays, :opponent_plays, :score
    def initialize()
        @plays = Array.new
        @opponent_plays = Array.new
        @score = 0
    end

    #These first two functions should push moves to each array 
    #add_score should simply increments score (no post or prefix incrementing in Ruby)

    def log_play(move)
        @plays.push(move)
    end
    
    def log_opponent_play(move)
        @opponent_plays.push(move)
    end

    def add_score()
        @score += 1 
    end
end