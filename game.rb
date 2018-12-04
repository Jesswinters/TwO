class Game
  def self.main
    game = Game.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def start
    until game_over? do
      @players.each do |player|
        question = Question.new
        puts "Welcome to TwO-O-Player!\n------------------------\nWhat is #{question.number_1} + #{question.number_2}?"

        if gets.chomp == question.answer.to_s
          puts "------------------------\nCorrectamundo!\n------------------------"
        else
          puts "------------------------\nNope, try again.\n------------------------"
          subtract_point
        end

        swap_players
        print_scores

      end

      if @players[0].points <= 0 && @players[1].points <=0
        puts "------------------------\nIt's a draw!\n------------------------"
      elsif @players[0].points <= 0
        puts "------------------------\nPlayer 1 loses"
      else @players[1].points <= 0
        puts "------------------------\nPlayer 2 loses\n------------------------"
      end
    end

    puts "Okay bye!"
  end

  def game_over?
    @players.any? { |player| player.points <= 0 }
  end

  def subtract_point
    current_player.subtract_point
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts "Would you like to change your name? (Y/N)"
      if gets.chomp == "Y"
        puts "Enter your new name: "
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
      end
    end
  end

  def print_scores
    @players.each do |player|
      puts "#{player.name} has #{player.points} points"
    end
  end

end
