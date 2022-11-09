require_relative '../trimmer_decorator'
require_relative '../teacher'

describe TrimmerDecorator do
  let(:teacher) { Teacher.new('Math', 30, 'maximilianus') }
  let(:trim_teacher) { TrimmerDecorator.new(teacher) }

  describe '#new' do
    it 'is a child class of BaseDecorator' do
      expect(TrimmerDecorator).to be < BaseDecorator
    end
  end

  describe 'returns a trimmed name' do
    it 'returns a trimmed teacher name' do
      expect(trim_teacher.correct_name).to eq('maximilian')
    end
  end
end
