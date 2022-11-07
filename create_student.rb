require_relative './student'

module CreateStudent
  def create_student(name, age, parent_permmission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name: name, parent_permmission: parent_permmission)
    @people << student
  end
end