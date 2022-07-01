require_relative '../catalog_classes/lable'
require_relative '../module/file_save'
class LabelHandler
  attr_reader :labels

  def initialize(all_items)
    # load_labels
    @all_items = all_items
    @labels = []
  end

  def add_label
    print 'Enter the title of Label: '
    title = gets.chomp
    print 'Enter the color of Label: '
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
    puts 'Label added successfully!'
    new_label
  end

  def list_all_labels(show_index: false)
    index = 1
    @labels.each do |label|
      puts "#{"#{index}) " if show_index}#{label.title} | #{label.color}"
      index += 1
    end
  end

  def select_label
    puts "\n Please Select a Label by number: "
    list_all_labels(show_index: true)
    puts "#{@labels.length + 1}) Add a label"
    print "\nOption: "
    choice = gets.chomp.to_i
    if choice.zero? || choice > @labels.length + 1
      puts 'Invalid choice! Try again!'
      return select_label
    end
    return add_label if choice == @labels.length + 1

    @labels[choice - 1]
  end

  def save_labels
    FileSave.save_data('labels', @labels)
  end

  def load_labels
    data = FileSave.read_data('labels')
    data.each do |label|
      new_label = Label.new(label['title'], label['color'], id: label['id'])
      label['items'].each do |id|
        found = @all_items.detect { |item| item.id == id }
        new_label.add_item(found) unless found.nil?
      end
      @labels << new_label
    end
  end
end
