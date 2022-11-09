require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 30) }

  describe '#new' do
    it 'takes a specialization, age as parameters and returns a Teacher object' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end

  describe '#specialization' do
    it 'returns the correct specialization' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#role' do
    it 'returns the correct role' do
      expect(teacher.role).to eq('Teacher')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
