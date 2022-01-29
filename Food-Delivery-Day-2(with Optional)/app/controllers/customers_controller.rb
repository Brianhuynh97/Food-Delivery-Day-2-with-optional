require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(repository)
    @customers_view = CustomersView.new
    @customer_repository = repository
  end

  def list
    @customers_view.display(@customer_repository.all)
  end

  def add
    name = @customers_view.ask_for('name')
    address = @customers_view.ask_for('address')
    @customer_repository.create(Customer.new(name: name, address: address))
  end

  def remove
    list
    index = @customers_view.ask_for_number('index')
    @customer_repository.destroy(index)
  end
end
