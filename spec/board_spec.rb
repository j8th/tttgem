require 'tictactoe_j8th/board'

include TictactoeJ8th

def fill_board
  9.times { |i| board.place(:X, i) }
end

describe Board do
  let(:board) { Board.new }

  context '#place' do
    it 'places the mark at position 0' do
      board.place(:something, 0)
      expect(board[0]).to eq(:something)
    end

    it 'places the mark at position 1 and returns true' do
      expect(board.place(:something, 1)).to eq(:something)
      expect(board[1]).to eq(:something)
    end

    it 'does not place the mark if taken and returns false' do
      board.place(:something, 1)
      expect(board.place(:something_else, 1)).to be_nil
      expect(board[1]).to eq(:something)
    end
  end

  context '#empty?' do
    it 'returns true when the board is empty' do
      expect(board.empty?).to eq(true)
    end

    it 'returns false when the board is not empty' do
      board.place(:something, 0)
      expect(board.empty?).to eq(false)
    end
  end

  context '#full?' do
    it 'returns false with a new board' do
      expect(board.full?).to eq(false)
    end

    it 'returns true when the board is full.' do
      fill_board
      expect(board.full?).to eq(true)
    end

    it 'does NOT return true just because we fill the last spot on the board.  (it returns false)' do
      board.place(:X, 8)
      expect(board.full?).to eq(false)
    end
  end

  context '#[]' do
    it 'Gets the value of the given spot' do
      board.place('X', 0)
      expect(board[0]).to eq('X')
    end
  end

  context '#lines' do
    it 'returns all the lines for a given board' do
      board.place('X', 0)
      board.place('X', 3)
      board.place('O', 4)
      expect(board.lines).to eq(
        [
          {0 => 'X', 1 => nil, 2 => nil},
          {3 => 'X', 4 => 'O', 5 => nil},
          {6 => nil, 7 => nil, 8 => nil},

          {0 => 'X', 3 => 'X', 6 => nil},
          {1 => nil, 4 => 'O', 7 => nil},
          {2 => nil, 5 => nil, 8 => nil},

          {0 => 'X', 4 => 'O', 8 => nil},
          {2 => nil, 4 => 'O', 6 => nil}
        ]
      )
    end
  end
end
