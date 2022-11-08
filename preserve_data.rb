require 'json'
require_relative './book'
require_relative './student'
require_relative './teacher'

module PreserveData
  PERSON_FILE_NAME = './person.json'.freeze
  RENTALS_FILE_NAME = './rentals.json'.freeze
  BOOKS_FILE_NAME = './books.json'.freeze

  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
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
    rentals_hash = []
    @rentals.each do |rental|
      rental_hash = {
        date: rental.date,
        book: {
          title: rental.book.title,
          author: rental.book.author
        },
        person: {
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age,
          parent_permission: rental.person.parent_permission,
          role: rental.person.role
        }
      }
      if rental.person.role == 'Student'
        rental_hash[:person][:classroom] = rental.person.classroom.label
      else
        rental_hash[:person][:specialization] = rental.person.specialization
      end
      rentals_hash << rental_hash
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
