
class Piece
  attr_accessor :position, :color
  attr_reader :symbol, :type, :active, :moves

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

    @moves += 1
  end

  def all_legal_moves

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


  end
end

class Rook < Piece

  def initialize(position, color, board) 
    @white = "\u2656"
    @black = "\u265C"
    super(position, color, board)
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
