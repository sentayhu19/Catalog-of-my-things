require_relative 'catalog_classes/item'
require_relative 'catalog_classes/genre'

gender = Genre.new('Movie')
items1 = Item.new(gender, 'Mielw', 'betaward', 'YMCMB', 2)
gender.add_item(items1)
