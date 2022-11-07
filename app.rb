require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './rental'
require_relative './display_books'
require_relative './display_people'
require_relative './display_rental'
# require_relative './student'
class App
  attr_accessor :books, :students, :teachers, :rentals

  include DisplayBooks
  include DisplayPeople
  include DisplayRental

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    person_option = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person_option == 1
      print 'Classroom: '
      classroom_ = gets.chomp
      print 'Has parent permmission? [Y/N]: '
      parent_permmission = gets.chomp.downcase == 'y'
      create_student(name, age, parent_permmission, classroom_)
    else
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(name, age, specialization)
    end
    puts 'Person created successfully'
  end

  def create_student(name, age, parent_permmission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name: name, parent_permmission: parent_permmission)
    @people << student
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_all_books
    selected_book_option = gets.chomp.to_i
    display_all_people
    selected_person_option = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    book = @books[selected_book_option]
    person = @people[selected_person_option]
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
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
      display_rental_by_id
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
