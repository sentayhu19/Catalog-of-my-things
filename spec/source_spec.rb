require_relative '../classes/source'
require_relative '../classes/movie'

describe Source do
  context 'Test source class' do
    source = Source.new 'Paramount'

    it 'source is an instance of Source class ' do
      expect(source).to be_instance_of Source
    end
    it 'Displays the correct source name' do
      expect(source.name).to eq 'Paramount'
    end

    it 'should add movie item object to source items array' do
      movie = Movie.new 'Transformers', '2019-06-18', true
      source.add_item(movie)
      expect(source.items[0]).to eq movie
    end
  end
end
