require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'

describe TicTacToe do
  before do
    # To remove all output statements that might clutter
    # test results.
    allow(STDOUT).to receive(:puts)
    allow(p1).to receive(:get_name)
    allow(p1).to receive(:get_symbol)
    allow(p2).to receive(:get_name)
    allow(p2).to receive(:get_symbol)
  end
  let(:p1) { instance_double(Player) }
  let(:p2) { instance_double(Player) }

  describe '#start_game' do
    before do
      allow(game_start).to receive(:play_game).with(p1, p2)
      allow(game_start).to receive(:duplicate_symbol_check).with(p1, p2)
    end
    subject(:game_start) { described_class.new }

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

    context 'When both players have same symbol' do
      it 'Loops until both have different symbols' do
        symbol_1 = 'x'
        symbol_2 = 'y'
        allow(p1).to receive(:symbol).and_return(symbol_1, symbol_1,symbol_1, symbol_2)
        allow(p2).to receive(:symbol).and_return(symbol_1)
        expect(p2).to receive(:get_symbol).exactly(3).times
        duplicate_sym_game.duplicate_symbol_check(p1, p2)
      end
    end
  end

  describe '#play_game' do
    subject(:playing_game) { described_class.new }
  end

end



