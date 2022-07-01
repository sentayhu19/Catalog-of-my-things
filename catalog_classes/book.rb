require relative './item'
class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state)
    super(publish_date: nil)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_data)
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json
  end
end
