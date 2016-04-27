require 'spec_helper.rb'

describe "Piece object" do

  describe '#new' do
    let(:white_pawn) { Pawn.new("a1", "white") }
    let(:black_pawn) { Pawn.new("g1", "black") }

    it 'gives white pieces the white symbol' do
      expect(white_pawn.symbol).to eq("\u2659")
    end

    it 'gives black pieces the black symbol' do
      expect(black_pawn.symbol).to eq("\u265F")
    end
  end
end
