class Person    
    def initialize(name)
        @name = name
    end  
    def override_method
    	p 'Person::override_method'
    end  
end

class Employee < Person
    def initialize(name, salary)#chained constructor
        super(name)
        @salary = salary
    end
    def override_method
    	super
    	p 'Employee::override_method'
    end
end

emp = Employee.new("Chuck", 100)

emp.override_method