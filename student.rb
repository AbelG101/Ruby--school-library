require_relative './person'

class Student < Person
  attr_reader :classroom, :role

  def initialize(classroom, age, name: 'unknown', parent_permmission: true, role: 'Student')
    puts "From student: #{classroom} #{age} #{name} #{parent_permmission}"
    super(age, name, parent_permmission: parent_permmission)
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
