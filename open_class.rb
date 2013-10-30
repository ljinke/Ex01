#in ruby, class is mutable. So it can be open and edit
#e.g. Open String to add more method
#monkey patch
class String
    def to_upper

    end
end

if __FILE__ == $0
'tom'.to_upper
end


