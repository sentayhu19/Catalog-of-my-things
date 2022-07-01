require 'json'
require_relative '../classes/book'
require_relative 'menu'

module BooksDataController
  def load_books
    file = './json/books.json'
    data = []

    if File.exist?(file)
      if File.empty?(file)
        data
      else
        JSON.parse(File.read(file))
      end
    else
      data
    end
  end

  def save_books(book)
    file = './json/books.json'
    data = []
    new_book = {
      'name' => book.name,
      'publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publish_date' => book.publish_date
    }

    data = JSON.parse(File.read(file)) if File.exist?(file)
    data << new_book
    File.write(file, JSON.pretty_generate(data))
  end

  def create_book
    print 'Enter book name: '
    name = gets.chomp

    print 'Enter the publisher: '
    publisher = gets.chomp

    print 'Enter Cover state: '
    cover_state = gets.chomp

    print 'Enter date published [yyyy-mm-dd]: '
    publish_date = gets.chomp

    new_book = Book.new(name, publisher, cover_state, publish_date)
    save_books(new_book)
    puts 'Book created successfully'
    puts menu_list
  rescue StandardError
    puts 'Cannot create book, check your Input formats'
  end

  def list_books
    books = load_books
    if books.empty?
      puts 'No Books to be displayed'
    else
      puts "#{books.count} Books Found!"
      books.each do |book|
        puts "Name: #{book['name']}\n" \
             "Publisher: #{book['publisher']}\nCover State: #{book['cover_state']}\n" \
             "Published Date: #{book['publish_date']}\n\n"
      end
    end
    puts menu_list
  end
end
