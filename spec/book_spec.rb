require_relative '../book.rb'
require_relative '../rental.rb'
require_relative '../person.rb'

describe Book do
  before :each do
    @book = Book.new('Prisoners', 'Lukas Browlie')
  end

  describe "#new" do
    it "takes two parameters and returns a book object" do
      @book.should be_an_instance_of Book
    end
  end

  describe "#rentals" do
    it "adds rentals to the book when rental is created" do
      rental = Rental.new("22/22/22", @book, Person.new(18, "Josh"))
      @book.rentals.length.should == 1
    end
  end
  
end