# NOTE: well... the Singleton design pattern (is also considered an anti-pattern)
#       and it's bascially about having only one instance in the entire system
# 

require 'singleton'

class Foobar
	include Singleton
end

# NOTE: it raises an error
# 
# foo = Foobar.new
#       
#       when using the Singleton module from Ruby, you make the 'new' a private method
#       and you have access only to a method called 'instance'
# 
bar = Foobar.instance
foo = Foobar.instance

puts foo === bar
# true
