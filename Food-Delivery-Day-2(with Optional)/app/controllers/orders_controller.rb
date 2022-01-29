require_relative '../views/orders_view'
require_relative '../views/employees_view'
require_relative '../views/customers_view'
require_relative '../views/meals_view'
require_relative '../models/order'


class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @employees_view = EmployeesView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def add
    meal = build_meal
    customer = build_customer
    employee = build_employee
    @order_repository.create(Order.new(meal: meal,
                                       customer: customer,
                                       employee: employee))
  end

  def list_undelivered_orders
    display_undelivered_orders
  end

  def list_my_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display(orders)
    index = @orders_view.ask_for('number').to_i - 1
    orders[index].deliver!
    @order_repository.update
  end

  private

  def display_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def build_meal
    @meals_view.display(@meal_repository.all)
    meal_index = @meals_view.ask_for_index
    @meal_repository.all[meal_index]
  end

  def build_customer
    @customers_view.display(@customer_repository.all)
    customer_index = @customers_view.ask_for_number('index')
    @customer_repository.all[customer_index]
  end

  def build_employee
    @employees_view.display(@employee_repository.all_riders)
    employee_index = @employees_view.ask_for_index
    @employee_repository.all_riders[employee_index]
  end
end
