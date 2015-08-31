class Employee
  attr_reader :salary
  def initialize(name, title, salary)
    @name, @title, @salary, @boss = name, title, salary
    @boss = nil
  end

  def boss=(employee=nil)
    @boss = employee
    @boss.employees << self
    if self.is_a?(Manager)
      self.employees.each do |employee|
        @boss.employees << employee
      end
    end
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary)
    super(name, title, salary)
    @employees = []
  end

  def bonus(multiplier)
    each_salary = []
    @employees.each do |employee|
      each_salary << employee.salary * multiplier
    end
    each_salary.inject(:+)
  end
end
