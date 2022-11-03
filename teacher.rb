require_relative './person'

class Teacher < Person
  attr_reader :specialization, :role

  def initialize(specialization, age, name = 'unknown', role: 'Teacher')
    super(age, name)
    @specialization = specialization
    @role = role
  end

  def can_use_services?
    true
  end
end
