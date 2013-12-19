module DogMixin
  class << self
    def included(base)
      p base
      base.extend ClassMethods
    end
  end

  def f
  end
  module ClassMethods
    def assign(*names)
      # @dogs is bound to the EACH DogOwner subclass
      @dog_names = names
    end

    def dog_names
      # @dogs is bound to the EACH DogOwner subclass
      @dog_names
    end
  end
end

class Owner
  include DogMixin
end

p Owner.methods
p Owner.instance_methods