require_relative '../movie'

describe Movie do
  before do
    source = double('Source')
    items = []
    allow(source).to receive(:name) { 'From a friend' }
    allow(source).to receive(:items) { items }
    @movie = Movie.new 'Daniel', source, 'LABEL', '12/11/2010', false
  end

  it 'The method can_be_archived should return true' do
    can_be_archived = @movie.can_be_archived?
    expect(can_be_archived).to be true
  end
end