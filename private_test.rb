module Base
  def public_method
    p "Base#public_method"
  end
  private
  def private_method
    p "Base#private_method"
  end
end

class A
  include Base

  def do
    public_method
    private_method#we can call modules private methods in mixinded class
  end

end

class SubA < A
  def test
    public_method
    private_method#we can call modules private methods in sub class
  end
end

A.new.do
SubA.new.do
SubA.new.test