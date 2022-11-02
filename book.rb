class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @tittle = title
    @author = author
    @rentals = []
  end

  def add_rental(price)
    @rentals << price
  end
end
