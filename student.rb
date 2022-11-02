require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name = 'unknown', parent_permmission: true)
    super(age, name, parent_permmission)
    @classroom = classroom(_classroom)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
