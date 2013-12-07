class Person    
    def initialize(name)
        @name = name
    end    
end

class Employee < Person
    def initialize(name, salary)
        super(name)
        @salary = salary
    end
end

emp = Employee.new("Chuck", 100)