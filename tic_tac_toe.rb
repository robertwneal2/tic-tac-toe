# controls game
class Game
  NUMS = '1234567890'.freeze

  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @current_turn = @player2 # player 1 actually goes first when players are    switched at beginning of game
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def play
    system('clear')
    until game_over?
      switch_players
      display_board
      puts "#{@current_turn.name}'s (#{@current_turn.mark}) turn to play"
      puts 'Enter row and col for move (leave space between):'
      move = gets.chomp 
      until valid_move?(move) # check if move valid
        puts 'Invalid move, try again:'
        move = gets.chomp # get new move
      end
      play_move(move, @current_turn.mark)
      system('clear')
    end
    display_board
    puts display_result
  end

  private

  def play_move(move, mark)
    row = move[0].to_i
    col = move[2].to_i
    @board[row][col] = mark
  end

  def switch_players
    if @current_turn == @player1
      @current_turn = @player2
    else
      @current_turn = @player1
    end
  end

  def display_board
    @board.each_with_index do |row, row_i|
      puts " #{row.join(' | ')} "
      puts '---+---+---' unless row_i == 2
    end
  end

  def game_over?
    return true if winner?
    return true if tie?

    false
  end

  # only determines IF there is a winner. the who is figured out by @current_turn
  def winner?
    return true if horz_3?
    return true if vert_3?
    return true if diag_3?

    false
  end

  def display_result
    return "#{@current_turn.name} wins!" if winner?

    'Tie!'
  end

  def tie?
    @board.flatten.none? { |mark| mark == ' ' }
  end

  def valid_move?(move)
    return false if move.length != 3
    return false unless NUMS.include?(move[0])
    return false unless NUMS.include?(move[2])

    row = move[0].to_i
    col = move[2].to_i

    return false unless @board[row][col] == ' '

    true
  end

  def horz_3?
    @board.each do |row|
      val = row[0]
      next if val == ' '
      return val if row.all? { |ele| ele == val }
    end
    false
  end

  def vert_3?
    board_copy = @board.map(&:clone) # transpose is lazy and easy. okay that this copy array shares same memory values
    board_copy.transpose.each do |row|
      val = row[0]
      next if val == ' '
      return val if row.all? { |ele| ele == val }
    end
    false
  end

  def diag_3?
    middle_val = @board[1][1]
    return false if middle_val == ' ' # no diag solutions if middle is blank
    return true if middle_val == @board[0][0] && middle_val == @board[2][2]
    return true if middle_val == @board[2][0] && middle_val == @board[0][2]

    false
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
