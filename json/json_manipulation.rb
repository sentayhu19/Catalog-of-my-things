require 'json'

class Manipulation
  def save_data(data, filname)
    return if data.empty?

    data_json = JSON.generate(data)
    File.open("json/#{filname}", 'w') do |file|
      file.puts data_json
    end
  end

  def read_data(filname)
    return unless File.exist?("json/#{filname}")

    file = File.read("json/#{filname}")
    JSON.parse(file, { symbolize_names: true })
  end
end
