module Mother; end  

class Father  
    include Mother  
end  

class Son < Father; end  

son = Son.new  

p son.kind_of? Son         # true  
p son.kind_of? Father      # true  
p son.kind_of? Mother      # true  

p son.is_a? Mother         # true  

p son.instance_of? Son     # true  
p son.instance_of? Father  # false  
p son.instance_of? Mother  # false  