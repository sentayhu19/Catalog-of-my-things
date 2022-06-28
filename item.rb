class Item
    attr_accessor :genre, :author, :source, :label, :publish_date, :archived
    def initialize(genre, author, source, label, publish_date, archived)
        super(genre, author, source, label, publish_date, archived)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end
end
