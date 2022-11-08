require_relative './create_teacher'
require_relative './create_student'

module CreatePerson
  include CreateStudent
  include CreateTeacher

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    person_option = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person_option == 1
      print 'Classroom: '
      classroom_ = gets.chomp
      print 'Has parent permmission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      create_student(name, age, parent_permission, classroom_)
    else
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(name, age, specialization)
    end
    puts 'Person created successfully'
  end
end
