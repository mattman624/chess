
class Piece
  
  attr_reader :symbol, :type, :active, :moves, :position, :prev_position, :color

  def initialize(position, color, board)
    @position = position
    @color = color
    @type = self.class
    @moves = 0
    @active = true
    @board = board
    set_mark(@color)
  end

  def set_mark(color)
     @symbol = color == "white" ? @white : @black
  end

  def move(coordinates)
    if all_legal_moves.include?(coordinates)
      @prev_position = @position
      @position = coordinates
      @board.set_piece(self)
      @moves += 1
    else
      false
    end
  end

  def all_legal_moves

  end

  def up_moves(position)
    moves = []
    move = @board.relative_position(position, 0, 1)
    up_space = @board.get_piece(move) unless move == nil

    if up_space == " "
      moves << move
      moves += up_moves(move)
    elsif move == nil || up_space.color == @color
      return moves
    elsif up_space != " " && up_space.color != @color 
      moves << move
    end
  end

  def down_moves(position)
    moves = []
    move = @board.relative_position(position, 0, -1)
    down_space = @board.get_piece(move) unless move == nil

    if down_space == " "
      moves << move
      moves += down_moves(move)
    elsif move == nil || down_space.color == @color
      return moves
    elsif down_space != " " && down_space.color != @color 
      moves << move
    end
  end

  def left_moves(position)
    moves = []
    move = @board.relative_position(position, -1, 0)
    left_space = @board.get_piece(move) unless move == nil

    if left_space == " "
      moves << move
      moves += left_moves(move)
    elsif move == nil || left_space.color == @color
      return moves
    elsif left_space != " " && left_space.color != @color 
      moves << move
    end
  end

  def right_moves(position)
    moves = []
    move = @board.relative_position(position, 1, 0)
    right_space = @board.get_piece(move) unless move == nil

    if right_space == " "
      moves << move
      moves += right_moves(move)
    elsif move == nil || right_space.color == @color
      return moves
    elsif right_space != " " && right_space.color != @color 
      moves << move
    end
  end
end

class Pawn < Piece

  def initialize(position, color, board) 
    @white = "\u2659"
    @black = "\u265F"
    super(position, color, board)
  end 

  def all_legal_moves
    moves = []

    moves << @board.relative_position(@position, 0, 1)
    if @board.get_piece(moves[0]) != " "
      return []
    elsif @moves == 0
      moves << @board.relative_position(@position, 0, 2)
    end
    moves
  end
end

class Rook < Piece

  def initialize(position, color, board) 
    @white = "\u2656"
    @black = "\u265C"
    super(position, color, board)
  end

  def all_legal_moves
    moves = []

    moves += up_moves(@position) + down_moves(@position) + left_moves(@position) + right_moves(@position)
    
  end
end

class Bishop < Piece

  def initialize(position, color, board)
    @white = "\u2657"
    @black = "\u265D"
    super(position, color, board)
  end
end

class Knight < Piece

  def initialize(position, color, board)
    @white = "\u2658"
    @black = "\u265E"
    super(position, color, board)
  end

  def all_legal_moves
    moves = []

    moves << @board.relative_position(@position, 2, 1)
    moves << @board.relative_position(@position, 2, -1)
    moves << @board.relative_position(@position, -2, 1)
    moves << @board.relative_position(@position, -2, -1)
    moves << @board.relative_position(@position, 1, 2)
    moves << @board.relative_position(@position, 1, -2)
    moves << @board.relative_position(@position, -1, 2)
    moves << @board.relative_position(@position, -1, -2)
  
    #only reason to sort is to pass tests
    moves.select! { |move| !move.nil? }.sort!
  end
end

class Queen < Piece

  def initialize(position, color, board)
    @white = "\u2655"
    @black = "\u265B"
    super(position, color, board)
  end
end

class King < Piece

  def initialize(position, color, board)    
    @white = "\u2654"
    @black = "\u265A"
    super(position, color, board)
  end
end  
