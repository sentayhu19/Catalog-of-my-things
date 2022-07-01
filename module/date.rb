require 'date'
module DateData
    def self.from_string(date)
        Date.parse(date)
      end
end
