class Enum

  private

  def self.enum_attr(name, num)
    name = name.to_s

    define_method(name + '?') do
      @attrs & num != 0
    end

    define_method(name + '=') do |set|
      if set
        @attrs |= num
      else
        @attrs &= ~num
      end
    end
  end

  public

  def initialize(attrs = 0)
    @attrs = attrs
  end

  def to_i
    @attrs
  end
end

if __FILE__ == $0

  class AuthType < Enum
    enum_attr :LinkedIn, 1
    enum_attr :WeiBo, 2
    enum_attr :Regist, 4
  end

  auth = AuthType.new(1)

  p auth.LinkedIn?
  p auth.WeiBo?
  p auth.Regist?
end