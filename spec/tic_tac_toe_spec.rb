require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'

describe TicTacToe do
  # To remove all output statements that might clutter
  # test results.
  before do
    allow(STDOUT).to receive(:puts)
  end

  describe '#start_game' do
    before do
      allow(p1).to receive(:get_name)
      allow(p1).to receive(:get_symbol)
      allow(p2).to receive(:get_name)
      allow(p2).to receive(:get_symbol)
      allow(game_start).to receive(:play_game).with(p1, p2)
      allow(game_start).to receive(:duplicate_symbol_check).with(p1, p2)
    end
    subject(:game_start) { described_class.new }
    let(:p1) { instance_double(Player) }
    let(:p2) { instance_double(Player) }

    context 'When called' do

      it 'Sends for player class to set name for both players' do
        expect(p1).to receive(:get_name).once
        expect(p2).to receive(:get_name).once
        game_start.start_game(p1, p2)
      end

      it 'Sends for player class to set symbol for both players' do
        expect(p1).to receive(:get_symbol).once
        expect(p2).to receive(:get_symbol).once
        game_start.start_game(p1, p2)
      end
    end
  end

  describe '#duplicate_symbol_check' do
    subject(:duplicate_sym_game) { described_class.new }
    
end



