require_relative './student'

module CreateStudent
  def create_student(name, age, parent_permission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    @people << student
  end
end
