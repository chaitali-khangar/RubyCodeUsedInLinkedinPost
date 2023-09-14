# Check class of puts
puts.class
# Find the owner of a puts class
puts_method = method(:puts); puts puts_method.owner
# Check Kernel is a class
Kernel.is_a? Class
# Check Kernel is a Module
Kernel.is_a? Module
# Available method for Kernel Module
Kernel.public_methods
# Check puts is private method for Kernel
Kernel.private_instance_methods.grep(/puts/)
# How Kernel is included in every object
'Ruby'.class.ancestors # [String, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]
5.class.ancestors # [Integer, Numeric, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]
5.5.class.ancestors # [Float, Numeric, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]
Hash.ancestors # [Hash, Enumerable, Object, PP::ObjectMixin, Kernel, BasicObject]
Array.ancestors # [Array, Enumerable, Object, PP::ObjectMixin, Kernel, BasicObject]