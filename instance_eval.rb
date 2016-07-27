class A
  attr_accessor :b

  def initialize
    @b = B.new(1, "first")
  end

end

class B
  attr_accessor :id, :name
  def initialize(id, name)
    @id=id
    @name=name
  end
end

a = A.new

p a.b.id
p a.instance_eval("b.id")