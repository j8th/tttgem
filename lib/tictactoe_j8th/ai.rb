class AI

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    return nil if board.full?

    # ####### Speed Hacks #######
    # Hacks to speed up minimax by bypassing most of the possible games.
    # The return statements here are important.  We make a move, then
    # bail out so that we don't end up analyzing all the possible games further down.
    # TODO:  See if there is a craftier, less hackish way to speed things up.

    # If the board is empty, always take the middle.
    if board.empty?
      board.place(token, 0)
      return 0
    end

    open_spots = get_open_spots(board)
    # If there is one spot taken, then always take the middle.
    # Unless the middle is taken already, then take the corner.
    if open_spots.count == Board::BOARD_SIZE-1
      spot = board[4].nil? ? 4 : 0
      board.place(token, spot)
      return spot
    end
    # ###### End Hacks ########


    enemy_token = discover_enemy_token(board)
    # Better here, but we do it above for our speed hacks.
    #open_spots = get_open_spots(board)
    games = Hash.new

    open_spots.each do |i|
      board_copy = board.create_copy
      board_copy.place(token, i)
      game = Game.new(board_copy, AI.new(enemy_token), AI.new(token))
      if game.winner == token
        board.place(token, i)
        return i
      end
      games[i] = game
    end

    scores = Hash.new

    games.each do |i, game|
      game.play
      scores[i] = 1 if game.winner == token
      scores[i] = -1 if game.winner == enemy_token
      scores[i] = 0 if game.winner.nil? and game.game_over?
    end

    max = scores.max_by { |k, v| v }
    spot = max[0]
    board.place(token, spot)
    spot
  end



  private
  # TODO:  Messy, reconsider this later.
  # Determine the enemy token.
  # Anything we find on the board that is not our token is considered the 'enemy_token'
  # We assume there is only one enemy token.
  # If we do not find any enemy tokens on the board, we assume the enemy token to be 'O',
  #   or we assume it to be 'X' if our own token is 'O'.
  def discover_enemy_token(board)
    enemy_token = nil
    (0..Board::BOARD_SIZE-1).each do |i|
      enemy_token = board[i] if board[i] != token and board[i] != nil
    end
    if enemy_token.nil?
      enemy_token = token == :X ? :O : :X
    end
    enemy_token
  end

  def get_open_spots(board)
    open_spots = Array.new
    (0..Board::BOARD_SIZE-1).each do |i|
      open_spots.push(i) if board[i].nil?
    end
    open_spots
  end

end