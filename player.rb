
class Player
  attr_reader :name, :color, :pieces

  def initialize(name, color, board)
    @name = name
    @board = board
    @color = color
    create_pieces
  end

  def create_pieces
    @pieces = []

    back_row = @color == "white" ? '1' : '8'
    front_row = @color == "white" ? '2' : '7'
    columns = %w(A B C D E F G H)

    columns.each do |column|
      @pieces << Pawn.new(column + front_row, @color, @board)

      if column == 'A' || column == 'H'
        @pieces << Rook.new(column + back_row, @color, @board)
      elsif column == 'B' || column == 'G'
        @pieces << Knight.new(column + back_row, @color, @board)
      elsif column == 'C' || column == 'F'
        @pieces << Bishop.new(column + back_row, @color, @board)
      elsif column == 'D'
        @pieces << Queen.new(column + back_row, @color, @board)
      else
        @pieces << King.new(column + back_row, @color, @board)
      end
    end
  end
end
