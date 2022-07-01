require 'json'
module FileSave
  def self.save_data(file_name, data)
    File.write("data/#{file_name}.json", JSON.pretty_generate(data), mode: 'a')
  end

  def self.read_data(file_name)
    return JSON.parse(File.read("data/#{file_name}.json")) if File.exist?("data/#{file_name}.json")
    []
  end
end
