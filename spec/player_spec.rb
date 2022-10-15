require_relative '../lib/player'

describe Player do

  describe '#get_name' do

    context 'if player_name.length > 10' do
      subject(:long_name) { described_class.new }

      it 'It restarts the loop until valid input is given' do
        invalid_name = 'fyodor dostoyevsky'
        valid_name = 'john'
        message = "Please keep your name under 10 characters"
        allow(long_name).to receive(:gets).and_return(invalid_name, invalid_name, invalid_name, valid_name)
        expect(long_name).to receive(:gets).exactly(4).times
        long_name.get_name
      end
    end

    context 'if player_name.length == 0 or player name is an empty space' do
      subject(:no_name) { described_class.new }

      it 'Restarts the loop if the name is empty or space' do
        space_name = ' '
        empty_name = ''
        valid_name = 'jon'
        allow(no_name).to receive(:gets).and_return(empty_name, empty_name, valid_name)
        expect(no_name).to receive(:gets).exactly(3).times
        no_name.get_name
      end
    end

    context 'if valid name is given' do
      subject(:perfect_name) { described_class.new }

      it 'Sets @name to valid name' do
        valid_name = 'Snow'
        allow(perfect_name).to receive(:gets).and_return(valid_name)
        perfect_name.get_name
        expect(perfect_name.name).to eq(valid_name)
      end
    end
  end




end
