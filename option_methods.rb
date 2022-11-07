module OptionMethods
  def option_methods(option, app)
    case option
    when 1
      app.display_all_books
    when 2
      app.display_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rental_by_id
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
