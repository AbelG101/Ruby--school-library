require_relative '../nameable'

describe Nameable do
  let(:nameable) { Nameable.new }
  describe '#nameable' do
    it 'will raise an error' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
