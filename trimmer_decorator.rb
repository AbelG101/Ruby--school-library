require_relative './base_decorator'
require_relative './person'
require_relative './capitalize_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0, 9] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
