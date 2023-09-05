# Everything is an object you can see parent is BasicObject
p "Ancestors of 5 is #{5.class.ancestors}" 
# Output of above: [Integer, Numeric, Comparable, Object, Kernel, BasicObject]
# ------------------------------------------------
# Creating class at Runtime
module Errors
  LinkedinError = Class.new(StandardError)
  SMTPConnectionQuotaExceededError = Class.new(LinkedinError)
end
p "Superclass of 'Errors::SMTPConnectionQuotaExceededError' is #{Errors::SMTPConnectionQuotaExceededError.superclass}" 
# Output of above:  Errors::LinkedinError
# ------------------------------------------------
# Superclass of Class
p "Superclas of 'Class' is #{Class.superclass}"
# Output of above: Module