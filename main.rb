require_relative './app'

def main
  app = App.new
  app.run()
  p app
end

def prompt
  loop do
    display_options()
    option = get_option()
    some(option)

    break if option == 7
  end
end

def display_options
  puts 'Please choose one of the options: '
  puts '1. - List all books'
  puts '2. - List all people'
  puts '3. - Create a person'
  puts '4. - Create a book'
  puts '5. - Create a rental'
  puts '6. - List all rentals for a given person ID'
  puts '7. - Exit'
end

def get_option
  print 'Enter a number: '
  option = gets.chomp.to_i
  while option.nil? || option < 1 || option > 7
    puts 'Please enter a number between 1 and 7!'
    print 'Enter a number: '
    option = gets.chomp.to_i
  end
  option
end

def some(option)
  # app = App.new
  case option
    when 1
      display_all_books()
    when 2
      display_all_people()

    when 3
      print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
      person_option = gets.chomp.to_i
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      # create a student
      if person_option == 1
        print 'Classroom: '
        classroom_ = gets.chomp
        print 'Has parent permmission? [Y/N]: '
        parent_permmission = gets.chomp.downcase == 'y' ? true : false
        create_student(name, age, parent_permmission, classroom_)
      # create a teacher
      else
        print 'Specialization: '
        specialization = gets.chomp
        create_teacher(name, age, specialization)
      end
      puts 'Person created successfully'
    when 4
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      create_book(title, author)
      puts 'Book created successfully'
    when 5
      puts "Select a book from the following list by number"
      display_all_books()
      selected_book_option = gets.chomp.to_i
      display_all_people()
      selected_person_option = gets.chomp.to_i
      print "Date: "
      date = gets.chomp
      create_rental(selected_book_option, selected_person_option, date)
      puts 'Rental created successfully'
    when 6
      print "Id of person: "
      person_id = gets.chomp.to_i
      get_rental_by_id(person_id)
    else 
      'exit'
  end
end

main()