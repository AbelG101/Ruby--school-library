require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './rental'
# require_relative './student'

class App

  attr_accessor :books, :students, :teachers

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

  def create_student(name, age, parent_permmission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name: name, parent_permmission: parent_permmission)
    @people << student
  end

  def create_teacher(name, age, specialization )
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(book_index, person_index, date)
    book = @books[book_index]
    person = @people[person_index]
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def get_rental_by_id(id)
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  def run
    prompt
  end
end