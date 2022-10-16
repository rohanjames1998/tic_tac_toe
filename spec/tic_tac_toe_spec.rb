require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'
require 'rspec/expectations'

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

      it 'sends for player class to set symbol for both players' do
        expect(p1).to receive(:get_symbol).once
        expect(p2).to receive(:get_symbol).once
        game_start.start_game(p1, p2)
      end
    end
  end

  describe '#duplicate_symbol_check' do
    subject(:duplicate_sym_game) { described_class.new }

    context 'When both players have same symbol' do
      it 'loops until both have different symbols' do
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
    before do
    allow(in_game).to receive(:restart_game)
    end
    subject(:in_game) { described_class.new }

    context 'When called' do
      it 'calls #round and ends the game if eng_game? is true' do
        allow(in_game).to receive(:end_game?).and_return(false, false, false, true)
        expect(in_game).to receive(:round).exactly(4).times
        in_game.play_game(p1, p2)
      end
    end
  end

  describe '#round' do
    RSpec::Matchers.define :be_increased_by_one do |prev_count|
      match do |new_count|
        new_count - 1 == prev_count
      end
    end
    subject(:game) { described_class.new }

    context 'When called' do
      before do
        allow(game).to receive(:display_grid)
        allow(game).to receive(:place_symbol_on_grid)
      end
      it 'increases rounds count by 1' do
        previous_rounds = game.rounds
        game.round(p1)
        expect(game.rounds).to be_increased_by_one(previous_rounds)
      end
    end
  end
end



