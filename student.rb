require_relative './person'

class Student < Person
  attr_reader :classroom, :role

  def initialize(classroom, age, name: 'unknown', parent_permission: true, role: 'Student')
    puts "From student: #{classroom} #{age} #{name} #{parent_permission}"
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @role = role
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
