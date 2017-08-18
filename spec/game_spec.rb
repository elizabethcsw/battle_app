require 'game'

describe Game do
  let (:player1) { double(:player1) }
  let (:player2) { double(:player2) }

  subject { described_class.new(player1, player2) }

  describe '#initialize' do
    it 'returns two players when initialized' do
      expect(subject.player1).to eq player1
      expect(subject.player2).to eq player2
    end
  end

  describe '#attack' do
    it 'attacks player 2' do
      expect(player2).to receive(:attacked)
      subject.attack(player2)
    end
  end
end
