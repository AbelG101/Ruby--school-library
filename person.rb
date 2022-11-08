require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :id, :name, :age
  attr_reader :rentals, :parent_permission

  def can_use_services?
    @parent_permission || of_age?
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
