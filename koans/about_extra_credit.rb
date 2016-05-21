# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.


def score(dice)
  #variable declarations
  triplePattern = /(\d)\1\1/
  @score = 0

  dice_str = dice.sort.join.to_s # Puts in the form "#####"

  #TRIPLES
  if triple = triplePattern.match(dice_str) # If there is a match of three consecutive numbers
    @score = triple[1].to_i*100 # Score = 100*matched number
    @score = 1000 if @score == 100 # Account for "111" = 1000 points
    dice_str.sub!(triplePattern, "") # Remove the found triple
  end

  #SINGLES
  for i in (0..dice_str.length-1)
    @score+=100 if dice_str[i] == "1"
    @score+=50 if dice_str[i] == "5"
  end

  @score
end

class DiceSet
  attr_reader :dice
  def roll(num_rolls)
    @dice = []
    (1..num_rolls).each do
      @dice << rand(5)+1
    end
  end

  def values
    @dice
  end

end

class Player
	attr_accessor @score
	attr_accessor @number

	def initialize(num)
		@score = 0
		@number = num
	end
end

class Game
	attr_accessor @players # array storing the players

	def initialize
		@num_players = 2
		@score_limit = 3000
		@dice = DiceSet.new

		for i in (1..@numPlayers) do # Initialize the player array
			@players[i-1] = Player.new(i)
		end
	end

	def start_game
		max_score = 0
		puts "Welcome to Greed!"
		puts "See GREED_RULES.txt for instructions on how to play"

		while max_score < 3000 do

		# I want to take turns until someone's score is greater than 3000
	end

	def take_turn(player)
		num_dice = 5
		roll_score = 0
		turnS_sore = 0
		dice.roll(num_dice)

	end

	def print_scores
		@players.each do |player|
			puts "Player #{player.number} has #{player.score} points"
		end
	end
end

