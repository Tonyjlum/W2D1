require "byebug"
class Employee
  attr_reader :salary, :boss, :title, :name

  def initialize (name, title, salary, boss)
  @name, @title, @salary, @boss = name, title, salary, boss

  add_boss unless boss.nil?
  end

  def add_boss
    self.boss.employees << self
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end


  def bonus(multiplier)
    employees_salary_sum * multiplier
  end

  def employees_salary_sum
    sum = 0
    self.employees.each do |el|
      e
      el.is_a?(Manager) ? sum += el.employees_salary_sum + el.salary : sum += el.salary
    end
    sum
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "Ta Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
