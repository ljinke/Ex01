require 'test/unit'

class TestUsing < Test::Unit::TestCase
  class Resource
    def dispose
      @disposed = true
    end
    
    def disposed?
      @disposed
    end
  end

  def test_dispose_of_resource
    r = Resource.new
    using(r) {p r.class.name}
    assert r.disposed?
  end
  
  def test_disposees_of_resources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception){
      using(r){
        raise Exception
      }
    }
    assert r.disposed?
  end
end


module Kernel
  def using(resource)
    begin
      yield resource
    ensure
      resource.dispose
    end
  end
end