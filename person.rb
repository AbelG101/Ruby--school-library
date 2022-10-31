class Person
  def initialize(age, name = 'unknown', parent_permmission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permmission = parent_permmission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    @parent_permmission || of_age?
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
