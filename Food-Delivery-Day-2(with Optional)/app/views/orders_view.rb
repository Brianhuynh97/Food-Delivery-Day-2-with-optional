require_relative 'base_view'

class OrdersView < BaseView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} #{order.employee.username} #{order.customer.name}"
    end
  end
end
