def try_ret_procnew
    ret = Proc.new { return "Baaam" }
    ret.call
    "This is not reached"
end

def try_ret_lambda
    ret = lambda { return "Baaam" }
    ret.call
    "This is printed"
end

if __FILE__ == $0
	p try_ret_procnew

	p try_ret_lambda
end