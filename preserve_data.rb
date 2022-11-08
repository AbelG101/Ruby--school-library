require 'json'
require_relative './book'
require_relative './student'
require_relative './teacher'

module PreserveData
  PERSON_FILE_NAME = './person.json'
  RENTALS_FILE_NAME = './rentals.json'
  BOOKS_FILE_NAME = './books.json'

  def save_to_file(file_name, data)
    File.open(file_name, "w") do |f|
      f.write(JSON.pretty_generate(data))
    end
  end

  def save_people
    people_hash = @people.map do |person|
      if person.role == 'Student'
        {
          id: person.id.to_s,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
          classroom: person.classroom.label,
          role: person.role
        }
      else
        {
          id: person.id.to_s, name: person.name, age: person.age,
          specialization: person.specialization, role: person.role
        }
      end
    end
    save_to_file(PERSON_FILE_NAME, people_hash)
  end

  def save_rentals
    rentals_hash = @rentals.map do |rental|
      {
        date: rental.date,
        book: {
          title: rental.book.title,
          author: rental.book.author
        },
        person: {
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age
        }
      }
    end
    save_to_file(RENTALS_FILE_NAME, rentals_hash)
  end

  def save_books
    books_hash = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    save_to_file(BOOKS_FILE_NAME, books_hash)
  end
end

