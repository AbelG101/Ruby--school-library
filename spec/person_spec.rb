require_relative '../person'
require_relative '../book'

describe Person do
  before :each do
    @person = Person.new(18, "Josh", parent_permission:false)
  end

  describe "#new" do
    it "takes two parameters and returns a person object" do
      @person.should be_an_instance_of Person
    end
  end

  describe "#can_use_services?" do
    it "should return true if the person is older than 17 years of age and false otherwise" do
      @person.can_use_services?.should eq true
      @person.age = 17
      @person.can_use_services?.should eq false
    end
  end

  describe "#correct_name" do
    it "should return the correct name without any change" do
      @person.correct_name.should eq @person.name
    end
  end

  describe "#add_rental" do
    it "should add a rental to the person object when creating a rental" do
      rental = Rental.new("22/22/22", Book.new('Prisoners', 'Lukas Browlie'), @person)
      @person.rentals.length.should == 1
    end

  end
end