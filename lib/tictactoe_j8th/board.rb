module TictactoeJ8th
  class Board
    BOARD_SIZE = 9
    BOARD_LINES = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      [0, 4, 8],
      [2, 4, 6]
    ]

    def initialize
      @board = Array.new(BOARD_SIZE)
    end

    def empty?
      board.all? { |value| value.nil? }
    end

    def place(item, position)
      board[position] = item if board[position].nil?
    end

    def full?
      return false if board.include? nil
      true
    end

    def [](spot)
      board[spot]
    end

    def lines
      array = []
      BOARD_LINES.each do |line|
        hash = {}
        line.each do |i|
          hash[i] = board[i]
        end
        array.push(hash)
      end
      array
    end

    def set_board(array)
      @board = array
    end

    def create_copy
      copy = Board.new
      copy.set_board(@board.dup)
      copy
    end

    def to_s
      string = ''
      board.each do |spot|
        string += spot.nil? ? 'E' : spot.to_s
      end
      string
    end

    ###############################
    # Public Class Methods
    ###############################
    def self.from_s(string)
      board = Board.new
      (0..BOARD_SIZE-1).each do |i|
        board.place(string[i].to_sym, i)
      end
      board
    end

    private
    attr_accessor :board
  end
end
