require 'json'

module AuthorModule
  def add_author(author)
    author_db = './json/authors.json'
    authors = []
    new_author = {
      'first_name' => author.multiplayer,
      'last_name' => author.last_played_at
    }

    authors = JSON.parse(File.read(author_db)) if File.exist?(author_db)

    authors << new_author
    File.write(author_db, JSON.pretty_generate(authors))
  end

  def fetch_authors
    author_db = './json/authors.json'
    authors = []

    if File.exist?(author_db)
      if File.empty?(author_db)
        authors
      else
        JSON.parse(File.read(author_db))
      end
    else
      authors
    end
  end

  def list_authors
    authors = fetch_authors

    if authors.empty?
      puts 'No Authors to be displayed'
    else
      puts "#{authors.count} Authors Found!"
      authors.each do |author|
        puts "First Name: #{author['first_name']} - Last Name: #{author['last_name']}"
      end
    end
  end
end
