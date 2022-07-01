require 'json'

module LabelsDataController
  def load_labels
    file = './json/labels.json'
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

  def save_labels(label)
    file = './json/labels.json'
    data = []
    new_label = {
      'title' => label.title,
      'color' => label.color
    }

    data = JSON.parse(File.read(file)) if File.exist?(file)
    data << new_label
    File.write(file, JSON.pretty_generate(data))
  end

  def list_labels
    labels = load_labels

    if labels.empty?
      puts 'No Lables to be displayed'.colorize(color: :magenta)
    else
      puts "#{labels.count} Labels Found!".colorize(color: :magenta)
      labels.each do |label|
        puts "Title: #{label['title']} - Color: #{label['color']}"
      end
    end
  end
end
