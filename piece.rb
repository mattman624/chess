
class Piece
  attr_accessor :position, :color
  attr_reader :symbol

  def initialize(position, color)
    @position = position
    @color = color
    set_mark(@color)
  end

  def set_mark(color)
     @symbol = color == "white" ? @white : @black
  end

  def move(coordinates)

  end

end

class Pawn < Piece

  def initialize(position, color) 
    @white = "\u2659"
    @black = "\u265F"
    super(position, color)
  end 
end

class Rook < Piece

  def initialize(position, color) 
    @white = "\u2656"
    @black = "\u265C"
    super(position, color)
  end
end

class Bishop < Piece

  def initialize(position, color)
    @white = "\u2657"
    @black = "\u265D"
    super(position, color)
  end
end

class Knight < Piece

  def initialize(position, color)
    @white = "\u2658"
    @black = "\u265E"
    super(position, color)
  end
end

class Queen < Piece

  def initialize(position, color)
    @white = "\u2655"
    @black = "\u265B"
    super(position, color)
  end
end

class King < Piece

  def initialize(position, color)    
    @white = "\u2654"
    @black = "\u265A"
    super(position, color)
  end
end  
