class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @address = args[:address]
  end

  def to_s
    "#{name} - #{address}"
  end

  def self.headers
    ['id', 'name', 'address']
  end

  def build_row
    [@id, @name, @address]
  end
end
