class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @price = args[:price]
  end

  def to_s
    "#{name} - $#{price}"
  end

  def self.headers
    ['id', 'name', 'price']
  end

  def build_row
    [@id, @name, @price]
  end
end
