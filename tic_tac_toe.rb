# controls game
class Game
  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @current_turn = @player1
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def play
    until game_over?
      display_board
      puts "#{@current_turn.name}'s turn to play: #{@current_turn.mark}"
      puts 'Enter row and col for move:'
      move = gets.chomp
      puts move
    end
    display_result
  end

  private

  def display_board
    @board.each_with_index do |row, row_i|
      puts " #{row.join(' | ')} "
      puts '---+---+---' unless row_i == 2
    end
  end

  def game_over?
    false
  end

  def display_result

  end
end

# human players
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

game1 = Game.new('Bert', 'Rob')
game1.play