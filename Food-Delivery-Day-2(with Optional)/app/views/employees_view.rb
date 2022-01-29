class EmployeesView
  def display(employees)
    employees.each_with_index { |employee, index| puts "#{index + 1}. #{employee.username}" }
  end

  def ask_for(string)
    puts "What is the #{string}?"
    print '>'
    gets.chomp.split.map(&:capitalize).join(' ')
  end

  def ask_for_number(string)
    puts "What is the #{string}?"
    print '>'
    gets.chomp.to_i
  end

  def ask_for_index
    puts "What is the index?"
    print '>'
    gets.chomp.to_i - 1
  end
end
