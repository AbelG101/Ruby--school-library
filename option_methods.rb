module OptionMethods
  def option_methods(option)
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
