require 'game'

describe Game do

  describe '#initialize' do
    it 'returns the hp when initialized' do
      expect(subject.hp).to eq 100
    end
  end

  describe '#attack' do
    let (:player2) { double(:player2) }

    it 'attacks player 2' do
      expect(player2).to receive_message_chain(:game, :attacked)
      subject.attack(player2)
    end
  end

  describe '#attacked' do
    it 'reduces hp by 10 when being attacked' do
      expect { subject.attacked }.to change { subject.hp }.by(-10)
    end
  end
end
