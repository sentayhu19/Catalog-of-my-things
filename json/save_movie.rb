require 'json'

class SaveMovie
  def save_data(data, filname)
    unless data.empty?
      data_json = JSON.generate(data)
      File.open("json/#{filname}", 'w') do |file|
        file.puts data_json
      end
    end
  end

  def read_data(filname)
    if File.exist?("json/#{filname}")
      file = File.read("json/#{filname}")
      data = JSON.parse(file, { symbolize_names: true })
    end
  end
end
