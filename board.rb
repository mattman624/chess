
class Board
  attr_accessor :spaces, :columns, :rows
  
  def initialize(columns = 8, rows = 8)
    @columns = columns
    @rows = rows
    @spaces = Array.new(columns) { Array.new(rows) { " " } }
  end 

  def set_piece(piece)
    coords = translate_coords(piece.position)
    if valid_input?(coords)      
      @spaces[coords[0] - 1][coords[1] - 1] = piece
    else
      false
    end    
  end

  def get_piece(coords)
    translated_coords = translate_coords(coords)
    if valid_input?(translated_coords)
      piece = @spaces[translated_coords[0] - 1][translated_coords[1] - 1]
    else 
      return nil
    end
  end  

  def valid_input?(coords)
    unless coords.nil?
      column = coords[0].to_i
      row = coords[1].to_i
      if column > @columns || column < 1 || row > @rows || row < 1
        false
      else
        true
      end
    else
      false
    end
  end

  def translate_coords(coords)
    table = { :a => 1, :b => 2, :c => 3, :d => 4, :e => 5, :f => 6, :g => 7, :h=> 8}
    translated_coords = [table[coords[0].to_sym], coords[1].to_i]
  end

  def chess_coords(column, row)
    table = %w(NA a b c d e f g h)
    "#{table[column]}#{row}"
  end


  def relative_position(coords, column_move, row_move)
    position = translate_coords(coords)
    new_column = position[0] + column_move
    new_row = position[1] + row_move
    chess_coords(new_column, new_row)
  end

  def show
    output = "C:"

    @columns.times { |i| output += "#{i + 1}|" }    

    @rows.times do |i| 
      line = ["#{i + 1}"]
      @columns.times do |j|
        line << get_piece(j + 1, i + 1)
      end
      output += "\n#{line.join("|")}|"
    end
    puts output
  end
end
