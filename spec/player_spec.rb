require 'spec_helper.rb'

describe 'Player object' do
  let(:board) { Board.new }
  let(:player1) { Player.new("Matt", "white", board) }
  
  describe '#new' do

    it 'returns a player with name and color' do
      expect(player1.name).to eq("Matt")
      expect(player1.color).to eq("white")
    end

    it 'creates a set of pieces' do
      expect(player1.pieces.size).to eq(16)
    end       
  end 
end
