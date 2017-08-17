require 'player'

describe Player do

  subject {Player.new('Liz')}

  describe '#name' do
    it 'returns the name when initialized' do
      expect(subject.name).to eq "Liz"
    end
  end

end
