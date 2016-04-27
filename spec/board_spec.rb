require 'spec_helper.rb'

describe 'Board object' do

  let(:board) { Board.new }
  let(:white_pawn) { Pawn.new("a2", "white", board) }
  let(:black_pawn) { Pawn.new("b3", "black", board) }
  let(:off_board_pawn) { Pawn.new("n9", "white", board) }
  let(:pieces) { [white_pawn, black_pawn]}

  describe '#new' do
    it 'creates an 8x8 board' do
      expect(board.columns).to eq(8)
    end
  end

  describe '#translate_coords' do
    it 'translates standard chess coordinates to array coordinates' do
      expect(board.translate_coords('a1')).to eq([1, 1])
    end
  end

  describe '#relative_position' do
    it 'finds the relative coordanates given position and translation' do
      expect(board.relative_position(white_pawn.position, 0, 1)).to eq('a3')
    end
  end

  describe '#set_piece' do
    it 'places piece objects on the board, given standard chess coordinates' do
      
      board.set_piece(white_pawn)
      expect(board.spaces[0][1]).to equal(white_pawn)
    end

    it 'doesn\'t set pieces off board' do
      expect(board.set_piece(off_board_pawn)).to eq(false)
    end
  end

  describe '#get_piece' do
    it 'returns the piece at a specified location' do
      board.set_piece(white_pawn)
      expect(board.get_piece("a2")).to equal(white_pawn)
    end

    it 'returns a single space if the location is empty' do
      expect(board.get_piece("a3")).to eq(" ")
    end
  end
end
