require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './rental'
require_relative './create_book'
require_relative './create_rental'
require_relative './create_person'

class App
  include CreateBook
  include CreateRental
  include CreatePerson

  attr_accessor :books, :students, :teachers, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_all_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def display_all_people
    @people.each_with_index do |people, index|
      puts "#{index}) [#{people.role}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def list_rental_by_id
    print 'Id of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
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
end
