require 'json'
require_relative './book'
require_relative './student'
require_relative './teacher'

module PreserveData
  PERSON_FILE_NAME = './person.json'
  RENTALS_FILE_NAME = './rentals.json'
  BOOKS_FILE_NAME = './books.json'

  def load_data
    load_people
    load_books
    load_rentals
  end

  def load_books
    books_hash = []
    return books_hash unless File.exist?(BOOKS_FILE_NAME)
    books_hash = load_data_from_file(BOOKS_FILE_NAME)
    @books = books_hash.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_people
    people_hash = []
    return people_hash unless File.exist?(PERSON_FILE_NAME)
    people_hash = load_data_from_file(PERSON_FILE_NAME)
    people_hash.each do |people|
      if people['role'] == 'Student'
        student = Student.new(Classroom.new(people['classroom']), people['age'], name: people['name'], parent_permission: people['parent_permission'])
        student.id = people['id']
        @people << student
      else
        teacher = Teacher.new(people['specialization'], people['age'], people['name'])
        teacher.id = people['id']
        @people << teacher
      end
    end
  end

  def load_rentals
    rentals_hash = []
    return rentals_hash unless File.exist?(RENTALS_FILE_NAME)
    rentals_hash = load_data_from_file(RENTALS_FILE_NAME)
    rentals_hash.each do |rental| 
      book = Book.new(rental['book']['title'], rental['book']['author'])
      person = make_rental(rental['person'])
      @rentals << Rental.new(rental['date'], book, person)
    end
    @rentals.each do |rental|
      puts rental.person.id
    end
  end

  def make_rental(person)
    if person['role'] == 'Student'
      student = Student.new(Classroom.new(person['classroom']), person['age'], name: person['name'], parent_permission: person['parent_permission'])
      student.id = person['id'].to_i
      return student
    else
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      teacher.id = person['id'].to_i
      return teacher
    end
  end

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

