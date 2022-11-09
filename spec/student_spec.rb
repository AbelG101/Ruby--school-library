require_relative '../student'
require_relative '../classroom'

describe Student do
  before :all do
    @classroom = Classroom.new('101A')
    @student = Student.new(@classroom, 22, name: 'Bill Gates', parent_permission: false)
  end

  describe '#new' do
    it 'takes 4 parameters and returns a student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#classroom' do
    it 'takes one parameter and adds the student to students array of classroom object' do
      @student.classroom = @classroom
      @student.classroom.students.length.should == 1
    end
  end
end
