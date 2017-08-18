require 'player'

describe Player do
  subject { Player.new('Liz') }

  describe '#name' do
    it 'returns the name when initialized' do
      expect(subject.name).to eq 'Liz'
    end
  end

  describe '#attack' do
    let (:player2) { double(:player2) }

    it 'attacks player 2' do
      expect(player2).to receive(:attacked)
      subject.attack(player2)
    end
  end

  describe '#attacked' do
    it 'returns the name when initialized' do
      expect { subject.attacked }.to change { subject.hp }.by(-10)
    end
  end
end
