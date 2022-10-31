class Person
  def initialize( age, name='unknown', parent_permmission=true)
    @id
    @name = name
    @age = age
    @parent_permmission = parent_permmission
  end

  attr_accessor :name, :age
  attr_reader :id

  private def is_of_age?
    return true if @age >= 18
    false
  end

  def can_use_services?
    @parent_permmission || is_of_age?
  end
end

