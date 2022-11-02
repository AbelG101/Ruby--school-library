class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @tittle = title
    @author = author
    @rentals = []
  end
end