require 'spec_helper.rb'

describe "Piece object" do
  let(:board) { Board.new }
  let(:white_pawn) { Pawn.new("a2", "white", board) }
  let(:black_pawn) { Pawn.new("a7", "black", board) }

  describe '#new' do
    
    it 'gives white pieces the white symbol' do
      expect(white_pawn.symbol).to eq("\u2659")
    end

    it 'gives black pieces the black symbol' do
      expect(black_pawn.symbol).to eq("\u265F")
    end
  end

  describe '#all_ legal_moves' do

    context 'in initial position' do

      describe 'Pawn subclass' do
        it 'finds two possible moves' do
          expect(white_pawn.all_legal_moves).to eq(['a3', 'a4'])
        end
      end
    end
  end
end
