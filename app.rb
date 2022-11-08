require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './rental'
require_relative './display_books'
require_relative './display_people'
require_relative './display_rental'
require_relative './create_book'
require_relative './create_rental'
require_relative './create_person'
require_relative './preserve_data'

class App
  include CreateBook
  include CreateRental
  include CreatePerson
  include DisplayBooks
  include DisplayPeople
  include DisplayRental
  include PreserveData

  attr_accessor :books, :students, :teachers, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
  end

  def run(option)
    case option
    when 1
      display_all_books
    when 2
      display_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rental_by_id
    else
      puts 'Thank you for using this app!'
      exit
    end
  end

  def exit
    save_books
    save_people
    save_rentals
  end
end
