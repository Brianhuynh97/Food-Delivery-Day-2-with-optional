class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(args = {})
    @id = args[:id]
    @meal = args[:meal]
    @customer = args[:customer]
    @employee = args[:employee]
    @delivered = args[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
  end

  def build_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end
end
