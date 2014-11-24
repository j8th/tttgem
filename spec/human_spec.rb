require 'tictactoe_j8th/human'
require 'tictactoe_j8th/board'

include TictactoeJ8th

describe 'Human' do

  let(:board)   { Board.new }
  let(:human)   { Human.new(:X) }

end
