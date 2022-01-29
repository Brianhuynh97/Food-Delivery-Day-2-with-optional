require 'csv'
require_relative '../models/order'
require_relative 'base_repository'

class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file_path)
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  def my_undelivered_orders(employee)
    undelivered_orders.select { |order| order.employee == employee }
  end

  def update
    save_csv
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == 'true'
    row[:meal] = fetch_row(@meal_repository, row[:meal_id].to_i)   ## need to make these into instances (call find!!)
    row[:customer] = fetch_row(@customer_repository, row[:customer_id].to_i) ## need to make these into instances
    row[:employee] = fetch_row(@employee_repository, row[:employee_id].to_i) ## need to make these into instances
    Order.new(row)
  end

  def fetch_row(repository, id)
    repository.find(id)
  end
end
