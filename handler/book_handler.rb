require_relative '../catalog_classes/book'
require_relative '../module/file_save'
require_relative '../module/date'
require_relative '../module/input_data'
class BookHandler
  attr_reader :books

  def initialize
    @books = []
    @file_name = 'book'
    # load_books
  end

  def add_book(genre_manager, label_manager, author_manager)
    print 'Enter the publish date of the book (yyyy-mm-dd): '
    publish_date = gets.chomp
    begin
      DateData.from_string(publish_date)
    rescue ArgumentError
      puts 'Invalid Date! Try again'
      add_book(genre_manager, label_manager, author_manager)
    end
    print 'Who is the Publisher of this book: '
    publisher = gets.chomp
    print 'How is the state of book cover: '
    cover_state = gets.chomp
    new_book = Book.new(publisher, publish_date, cover_state)
    @books << new_book
    puts 'Book added Successfully!'
    save_books
  end

  def list_all_books
    puts 'No saved book.' if @books.empty?
    @books.each do |book|
      puts "Name: #{book.publisher}, Publish Date: #{book.publish_date}, cover 11state: #{book.cover_state}"
    end
  end

  def save_books
    FileSave.save_data('book', @books)
  end

  def load_books
    data = FileSave.read_data('book')
    data.each do |book|
      @books << Book.new(book['publisher'],
                         book['publish_date'],
                         book['cover_state'],
                         id: book['id'],
                         archived: book['archived'])
    end
  end
end
