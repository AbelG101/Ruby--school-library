require_relative './rental'

module CreateRental
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
end
