module DisplayRental
  def list_rental_by_id
    print 'Id of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
