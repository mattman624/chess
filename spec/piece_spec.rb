require 'spec_helper.rb'

describe "Piece object" do
  let(:board) { Board.new }
  let(:white_pawn) { Pawn.new("a2", "white", board) }
  let(:black_pawn) { Pawn.new("a7", "black", board) }
  let(:knight) { Knight.new("b1", "white", board) }
  let(:rook) { Rook.new("a1", "white", board) }
  let(:queen) { Queen.new("e4", "black", board) }

  describe '#new' do
    
    it 'gives white pieces the white symbol' do
      expect(white_pawn.symbol).to eq("\u2659")
    end

    it 'gives black pieces the black symbol' do
      expect(black_pawn.symbol).to eq("\u265F")
    end
  end

  describe '#all_ legal_moves' do

    context 'in initial position on empty board' do

      describe 'Pawn subclass' do
        it 'finds two possible moves' do
          expect(white_pawn.all_legal_moves).to eq(['a3', 'a4'])
        end
      end

      describe 'Knight subclass' do
        it 'finds three possible moves' do
          expect(knight.all_legal_moves).to eq(["a3", "c3", "d2"])
        end
      end

      describe 'Rook subclass' do
        it 'finds 14 possible moves' do
          expect(rook.all_legal_moves).to eq(%w(a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1))
        end
      end
    end

    context 'with conflicting friendly pieces' do
      describe 'Pawn subclass' do
        it "can't move past friendly pieces" do
          board.set_piece(Pawn.new("a3", "white", board))
          expect(white_pawn.all_legal_moves).to eq([])
        end
      end

      describe 'Rook class' do
        it "can't move past friendly pieces" do
          board.set_piece(Pawn.new("a3", "white", board))
          expect(rook.all_legal_moves).to eq(%w(a2 b1 c1 d1 e1 f1 g1 h1))
        end
      end
    end

    context 'with enemy pieces in path' do
      before { board.set_piece(Pawn.new("a3", "black", board)) }

      describe 'Pawn class' do
        it "can't take the piece" do          
          expect(white_pawn.all_legal_moves).to eq([])
        end
      end

      describe 'Rook class' do
        it "takes the piece, but can't move past" do
          expect(rook.all_legal_moves).to eq(%w(a2 a3 b1 c1 d1 e1 f1 g1 h1))
        end
      end
    end
  end

  describe '#move' do
    it 'moves the piece on the board to valid coordinates' do
      white_pawn.move("a3")
      expect(board.get_piece('a3')).to equal(white_pawn)
    end

    it "returns false for bad moves" do
      expect(white_pawn.move("g3")).to eq(false)
    end
  end

  describe '#up_moves' do
    it 'finds all moves straight forward' do
      expect(rook.up_moves(rook.position)).to eq(%w(a2 a3 a4 a5 a6 a7 a8))
    end
  end

  describe '#down_moves' do
    it 'finds all moves straight back' do
      queen1 = Queen.new("a8", "white", board)
      expect(queen.down_moves(queen1.position)).to eq(%w(a1 a2 a3 a4 a5 a6 a7).reverse)
    end
  end

  describe '#right_moves' do
    it 'finds all moves stright right' do
      expect(rook.right_moves(rook.position)).to eq(%w(b1 c1 d1 e1 f1 g1 h1))
    end
  end

  describe '#left_moves' do
    it 'finds all moves stright left' do
      expect(rook.left_moves(rook.position)).to eq([])
    end
  end

  describe '#up_left_moves' do
    it 'finds all diagonal moves up-left' do      
      expect(queen.up_left_moves(queen.position)).to eq(%w(a8 b7 c6 d5))
    end
  end

  describe '#up_right_moves' do
  end
end
