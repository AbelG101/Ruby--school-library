require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permmission: true)
    super()
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permmission = parent_permmission
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals

  def can_use_services?
    @parent_permmission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(price)
    @rentals << price
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
