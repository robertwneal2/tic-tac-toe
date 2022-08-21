require_relative '../lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    # No test necessary when only creating instance variables.
  end
end

describe Game do
  describe '#initialize' do
    subject(:game) { described_class.new('Bert', 'Rob')}

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
    #no tests necessary
  end

  describe '#game_over?' do

  end

  describe '#switch_players' do

  end

  describe '#valid_move' do

  end

  describe '#player_move' do

  end
end