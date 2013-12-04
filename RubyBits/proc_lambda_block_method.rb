p '*****************************************Proc******************************************************************************'
p 'Proc objects are blocks of code that have been bound to a set of local variables. 
	Once bound, the code may be called in different contexts and still access those variables.'
def gen_times(factor)
    return Proc.new {|n| n*factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12)               #=> 36
p times5.call(5)                #=> 25
p times3.call(times5.call(4))   #=> 60

p 'pass proc as argument'

def foo (a, b)
    a.call(b)
end

putser = Proc.new {|x| puts x}
p foo(putser, 34)

p '**************************************************lambda**********************************************************************'
p 'lambda: Equivalent to Proc.new, except'
p '1. the resulting Proc objects check the number of parameters passed when called.. '

lamb = lambda {|x, y| puts x + y}
pnew = Proc.new {|x, y| puts x + y}

# works fine, printing 6
p pnew.call(2, 4, 11)

# throws an ArgumentError
#p lamb.call(2, 4, 11)

p '2. return value'
p 'A return from Proc.new returns from the enclosing method (acting just like a return from a block)'
def try_ret_procnew
    ret = Proc.new { return "Baaam" }
    ret.call
    "This is not reached"
end

# prints "Baaam"
p try_ret_procnew

p 'Return from lambda acts returning to its caller'

def try_ret_lambda
    ret = lambda { return "Baaam" }
    ret.call
    "This is printed"
end

# prints "This is printed"
p try_ret_lambda

p '***********************************************Methods*************************************'

p 'methods are not bound to the local variables around them. Rather, they are bound to some object and have access to its instance variables '
p 'thinking about methods is sending messages. '
p 'Given a receiver – an object that has some method defined, we can send it a message – by calling the method, optionally providing some arguments. '
p 'method is OO terminology while Proc is functional programming terminology'
class Boogy
    def initialize
        @dix = 15
    end

    def arbo
        puts "#{@dix} ha\n"
    end
end

# initializes an instance of Boogy
b = Boogy.new

# prints "15 ha"
b.arbo

# method/message name is given as a string
b.send("arbo")

# method/message name is given as a symbol
b.send(:arbo)

p 'methods can also be defined in the “top-level” scope, not inside any class'

def say (something)
    puts something
end

say "Hello"


p '***********************************************block*************************************'

# a naked block can't live in Ruby
# this is a compilation error !
#{ puts "hello" }

# now it's alive, having been converted
# to a Proc !
pr = lambda { puts "hello" }

pr.call

def do_twice_block
    yield 
    yield
end

do_twice_block {puts "Hola"}

def do_twice_lambda(what)
    what.call
    what.call
end

do_twice_lambda lambda {puts "Hola"}

p '******************************************************&*****************************************'
p '& is used to indicate that we are expecting a block, however, the argument can be used as Proc'

def contrived(a, &f)
    # the block can be accessed through f
    f.call(a)
    
    # but yield also works !
    yield(a)
end

# this works
contrived(25) {|x| puts x}

# this doesn't (ArgumentError), because &f 
# isn't really an argument - it's only there 
# to convert a block
#contrived(25, lambda {|x| puts x})

p '***********************************************Symbo to Proc******************************************'

p [1,2,3].inject(0,&:+)

#:captialize = lambda {|x| x.capitalize}
p ['a','b','c'].map(&:capitalize)  #=>['A','B','C']

class Symbol
  def to_proc
    Proc.new {|x| x.send(self)}  # invoke a method by symbol
  end
end
