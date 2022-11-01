class Nameable
  def correct_name
    raise NotImplementedError.new("method should be implemented in concrete class")
  end
end
