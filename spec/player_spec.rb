require_relative '../lib/player'

describe Player do

  describe '#get_name' do

    context 'if player_name length > 10' do
      before do
        allow(big_name).to receive(:get_symbol).and_return('x')
      end
      subject(:big_name) { described_class.new }

      it 'It puts a message' do
        invalid_name = 'fyodor dostoyevsky'
        message = "Please keep your name under 10 characters"
        expect(player).to receive(message)
        big_name.get_name
      end
    end
  end




end
