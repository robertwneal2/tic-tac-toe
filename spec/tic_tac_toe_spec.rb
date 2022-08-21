require_relative '../lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    # No test necessary when only creating instance variables.
  end
end

describe Game do
  # Comment out 'private' in tic_tac_toe.rb to test private methods publicly

  describe '#initialize' do
    subject(:game) { described_class.new('Bert', 'Rob') }

    it 'has a player1 instance variable of the Player class' do
      player1 = game.instance_variable_get(:@player1)
      expect(player1.class).to eq(Player)
    end

    it 'has a player2 instance variable of the Player class' do
      player2 = game.instance_variable_get(:@player2)
      expect(player2.class).to eq(Player)
    end
  end

  describe '#play' do
    # No tests necessary
  end

  describe '#game_over?' do
    # Two methods that determine this, test those instead
  end

  describe '#winner?' do
    # Three methods that determine this, test those instead
  end


  describe '#place_move_on_board' do
    subject(:game_place) { described_class.new('Bert', 'Rob') }

    it 'places a move on board given its row, col, and mark' do
      row = 1
      col = 1
      mark = 'X'
      game_place.place_move_on_board(row, col, mark)
      board = game_place.instance_variable_get(:@board)
      expect(board[row][col]).to eq(mark)
    end
  end

  describe '#play_move' do
    subject(:game_play_move) { described_class.new('Bert', 'Rob') }

    it 'plays a move' do
      move = '1 1'
      mark = 'X'
      game_play_move.play_move(move, mark)
      board = game_play_move.instance_variable_get(:@board)
      expect(board[1][1]).to eq(mark)
    end
  end

  describe '#horz_3?' do
    subject(:game_horz) { described_class.new('Bert', 'Rob') }

    it 'returns true when thre are three marks in a row horizontally' do
      game_horz.place_move_on_board(0, 0, 'X')
      game_horz.place_move_on_board(0, 1, 'X')
      game_horz.place_move_on_board(0, 2, 'X')
      expect(game_horz).to be_horz_3
    end

    it 'returns false when thre are not three marks in a row horizontally' do
      game_horz.place_move_on_board(0, 0, 'X')
      game_horz.place_move_on_board(0, 1, 'X')
      game_horz.place_move_on_board(1, 2, 'X')
      expect(game_horz).not_to be_horz_3
    end
  end

  describe '#vert_3?' do
    subject(:game_vert) { described_class.new('Bert', 'Rob') }

    it 'returns true when thre are three marks in a row vetically' do
      game_vert.place_move_on_board(0, 0, 'X')
      game_vert.place_move_on_board(1, 0, 'X')
      game_vert.place_move_on_board(2, 0, 'X')
      expect(game_vert).to be_vert_3
    end

    it 'returns false when thre are not three marks in a row vertically' do
      game_vert.place_move_on_board(0, 0, 'X')
      game_vert.place_move_on_board(0, 1, 'X')
      game_vert.place_move_on_board(1, 2, 'X')
      expect(game_vert).not_to be_vert_3
    end
  end

  describe '#diag_3?' do
    subject(:game_diag) { described_class.new('Bert', 'Rob') }

    it 'returns true when thre are three marks in a row diagonally' do
      game_diag.place_move_on_board(0, 0, 'X')
      game_diag.place_move_on_board(1, 1, 'X')
      game_diag.place_move_on_board(2, 2, 'X')
      expect(game_diag).to be_diag_3
    end

    it 'returns false when thre are not three marks in a row diagonally' do
      game_diag.place_move_on_board(0, 0, 'X')
      game_diag.place_move_on_board(0, 1, 'X')
      game_diag.place_move_on_board(1, 2, 'X')
      expect(game_diag).not_to be_diag_3
    end
  end

  describe '#tie' do
    subject(:game_tie) { described_class.new('Bert', 'Rob') }

    it 'returns true if board is full' do
      game_tie.place_move_on_board(0, 0, 'X')
      game_tie.place_move_on_board(0, 1, '0')
      game_tie.place_move_on_board(0, 2, 'X')
      game_tie.place_move_on_board(1, 0, '0')
      game_tie.place_move_on_board(1, 1, 'X')
      game_tie.place_move_on_board(1, 2, '0')
      game_tie.place_move_on_board(2, 0, 'X')
      game_tie.place_move_on_board(2, 1, '0')
      game_tie.place_move_on_board(2, 2, 'X')
      expect(game_tie).to be_tie
    end

    it 'returns false if board is not full' do
      game_tie.place_move_on_board(0, 0, 'X')
      expect(game_tie).not_to be_tie
    end
  end

  describe '#switch_players' do
    subject(:game_switch) { described_class.new('Bert', 'Rob') }

    it 'changes @current_turn from @player2 to @player1' do
      player1 = game_switch.instance_variable_get(:@player1)
      game_switch.switch_players
      current_turn = game_switch.instance_variable_get(:@current_turn) #starts as player2
      expect(current_turn).to eq(player1)
    end

    it 'changes @current_turn from @player1 to @player2' do
      player2 = game_switch.instance_variable_get(:@player1)
      game_switch.switch_players
      current_turn = game_switch.instance_variable_get(:@current_turn) #start with player1 and switch to player2
      expect(current_turn).to eq(player2)
    end
  end

  describe '#valid_move' do
    subject(:game_valid) { described_class.new('Bert', 'Rob') }

    it' return true when move is valid' do
      move = '1 1'
      result = game_valid.valid_move?(move)
      expect(result).to be_truthy
    end

    it 'returns false when move is invalid' do
      move = '1 4'
      result = game_valid.valid_move?(move)
      expect(result).to be_falsy
    end
  end

end