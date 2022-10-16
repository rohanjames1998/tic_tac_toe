require_relative '../lib/player'

describe Player do
  # To remove all output statements that might clutter
  # test results.
  before do
    allow(STDOUT).to receive(:puts)
  end

  describe '#get_name' do

    context 'If player_name.length > 10' do
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

    context 'If player_name.length == 0 or player name is an empty space' do
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

    context 'If name given is valid' do
      subject(:perfect_name) { described_class.new }

      it 'Sets @name to valid name' do
        valid_name = 'Snow'
        allow(perfect_name).to receive(:gets).and_return(valid_name)
        perfect_name.get_name
        expect(perfect_name.name).to eq(valid_name)
      end
    end
  end

  describe '#get_symbol' do

    context 'If symbol length is > 1' do
      subject(:long_symbol) { described_class.new }

        it 'Restarts the loop until valid symbol is given' do
        invalid_symbol = 'xD'
        valid_symbol = 'x'
        # allow(long_symbol).to receive(:name).with('jon')
        allow(long_symbol).to receive(:gets).and_return(invalid_symbol, invalid_symbol, valid_symbol)
        expect(long_symbol).to receive(:gets).exactly(3).times
        long_symbol.get_symbol
      end
    end

    context 'If symbol is an integer' do
      subject(:int_symbol) { described_class.new }

      it 'Restarts the loop until a non integer is given' do
      invalid_symbol = '4'
      valid_symbol = 'y'
      allow(int_symbol).to receive(:gets).and_return(invalid_symbol, invalid_symbol, valid_symbol)
      expect(int_symbol).to receive(:gets).exactly(3).times
      int_symbol.get_symbol
    end
  end

  context 'If no symbol is given (i.e., empty space or no symbol at all)' do
    subject(:no_symbol) { described_class.new }

    it 'Restarts the loop until a symbol is given' do
    empty_symbol = ''
    space_symbol = ' '
    valid_symbol = '@'
    allow(no_symbol).to receive(:gets).and_return(empty_symbol, space_symbol, valid_symbol)
    expect(no_symbol).to receive(:gets).exactly(3).times
    no_symbol.get_symbol
    end
  end

  context 'If valid symbol is given' do
    subject(:perfect_symbol) { described_class.new }

    it 'Changes player symbol to given symbol' do
      valid_symbol = '~'
      allow(perfect_symbol).to receive(:gets).and_return(valid_symbol)
      perfect_symbol.get_symbol
      expect(perfect_symbol.symbol).to eq(valid_symbol)
    end
  end
  end
end
