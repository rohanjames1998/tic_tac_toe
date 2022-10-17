require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'
require 'rspec/expectations'

describe TicTacToe do
  before do
    # To remove all output statements that might clutter
    # test results.
    allow(STDOUT).to receive(:puts)
    allow(p1).to receive(:symbol)
    allow(p1).to receive(:name)
    allow(p1).to receive(:get_name)
    allow(p1).to receive(:get_symbol)
    allow(p2).to receive(:name)
    allow(p2).to receive(:symbol)
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
       prev_count == (new_count - 1)
      end
    end
    subject(:single_round) { described_class.new }

    context 'When called' do
      before do
        allow(single_round).to receive(:display_grid)
        allow(single_round).to receive(:place_symbol_on_grid)
      end
      it 'increases rounds count by 1' do
        previous_rounds = single_round.rounds
        single_round.round(p1)
        new_count = single_round.rounds
        expect(new_count).to be_increased_by_one(previous_rounds)
      end
    end
  end

  describe '#place_symbol_on_grid' do
    before do
      allow(placing_on_grid).to receive(:symbol_place)
    end
    subject(:placing_on_grid) { described_class.new }

    context 'When place already contains a symbol' do
      it 'restarts the loop until a valid place is given' do
        allow(placing_on_grid).to receive(:does_not_have_symbol?).and_return(false, true)
        expect(placing_on_grid).to receive(:symbol_place).twice
        placing_on_grid.place_symbol_on_grid(p1)
      end
    end
  end

  describe '#symbol_place' do
    subject(:place_check) { described_class.new }

    context 'When given valid input' do
      it 'returns an integer' do
        allow(place_check).to receive(:gets).and_return('2')
        return_val = place_check.symbol_place(p1)
        expect(return_val).to be_integer
      end
    end

    context 'When given place is not an integer' do
      it 'loops until an integer between 0-9 is given' do
        allow(place_check).to receive(:gets).and_return('a', '1')
        expect(place_check).to receive(:gets).twice
        place_check.symbol_place(p1)
      end
    end
  end
end

# Below are some tests I wrote for methods that I decided to make private. I have left them here so that they can be used
# in the future if I ever decided to make those methods public.


#   describe '#end_game?' do
#     subject(:finished_game) { described_class.new }

#     context 'When game is finished' do
#       it 'returns true' do
#         allow(finished_game).to receive(:is_winner?).and_return true
#         returned_val = finished_game.end_game?(p1)
#         expect(returned_val).to eq(true)
#       end
#     end

#     context 'When 9 rounds have passed' do
#       it 'returns true' do
#         finished_game.rounds = 9
#         returned_val = finished_game.end_game?(p1)
#         expect(returned_val).to eq(true)
#       end
#     end

#     context 'When end conditions are not met' do
#       it 'returns false' do
#         returned_val = finished_game.end_game?(p2)
#         expect(returned_val).to eq(false)
#       end
#     end
#   end

#   describe '#is_winner' do
#     subject(:grid_check) { described_class.new }
#     context 'When there is any horizontal alignment on the grid' do
#       it 'returns true for first condition' do
#         grid_check.game_grids[1] = 'x'
#         grid_check.game_grids[2] = 'x'
#         grid_check.game_grids[3] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end

#       it 'returns true for second condition' do
#         grid_check.game_grids[4] = 'x'
#         grid_check.game_grids[5] = 'x'
#         grid_check.game_grids[6] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end

#       it 'returns true for third condition' do
#         grid_check.game_grids[7] = 'x'
#         grid_check.game_grids[8] = 'x'
#         grid_check.game_grids[9] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end
#     end

#     context 'When there is any vertical alignment on the grid' do
#       it 'returns true for first condition' do
#         grid_check.game_grids[1] = 'x'
#         grid_check.game_grids[4] = 'x'
#         grid_check.game_grids[7] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end

#       it 'returns true for second condition' do
#         grid_check.game_grids[2] = 'x'
#         grid_check.game_grids[5] = 'x'
#         grid_check.game_grids[8] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end

#       it 'returns true for third condition' do
#         grid_check.game_grids[3] = 'x'
#         grid_check.game_grids[6] = 'x'
#         grid_check.game_grids[9] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end
#     end

#     context 'When there is any cross alignment on the grid' do
#       it 'returns true for first condition' do
#         grid_check.game_grids[1] = 'x'
#         grid_check.game_grids[5] = 'x'
#         grid_check.game_grids[9] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end
#       it 'returns true for second condition' do
#         grid_check.game_grids[3] = 'x'
#         grid_check.game_grids[5] = 'x'
#         grid_check.game_grids[7] = 'x'
#         returned_val = grid_check.is_winner?
#         expect(returned_val).to eq(true)
#       end
#     end
#   end
# end



