
class Player
  attr_reader :name, :color, :pieces

  def initialize(name, color)
    @name = name
    @color = color
    set_pieces
  end

  def set_pieces
    @pieces = []

    back_row = @color == "white" ? '1' : '8'
    front_row = @color == "white" ? '2' : '7'
    columns = %w(A B C D E F G H)

    columns.each do |column|
      @pieces << Pawn.new(column + front_row, @color)

      if column == 'A' || column == 'H'
        @pieces << Rook.new(column + back_row, @color)
      elsif column == 'B' || column == 'G'
        @pieces << Knight.new(column + back_row, @color)
      elsif column == 'C' || column == 'F'
        @pieces << Bishop.new(column + back_row, @color)
      elsif column == 'D'
        @pieces << Queen.new(column + back_row, @color)
      else
        @pieces << King.new(column + back_row, @color)
      end
    end
  end
end
