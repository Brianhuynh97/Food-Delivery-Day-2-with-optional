class CustomersView
  def display(customers)
    customers.each_with_index { |customer, index| puts "#{index + 1}. #{customer}" }
  end

  def ask_for(something)
    puts "What is the customer's #{something}?"
    print '>'
    gets.chomp
  end

  def ask_for_number(something)
    puts "What is the customer's #{something}?"
    print '>'
    gets.chomp.to_i - 1
  end
end
