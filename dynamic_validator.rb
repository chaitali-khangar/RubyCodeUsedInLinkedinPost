def create_dynamic_validator_class(validator_name, validator_rules)
  # Create the class with a unique name
  validator_class = Class.new do
    attr_reader :errors

    def initialize
      @errors = {}
    end

    def validate(data)
      @errors.clear
      self.class.const_get('VALIDATION_RULES').each do |field, regex|
        @errors[field] = "Invalid #{field}" unless data[field] =~ regex
      end
      @errors.empty?
    end
  end

  # Set the class as a constant
  validator_class_name = Object.const_set("#{validator_name}Validator", validator_class)

  validator_class_name.const_set("VALIDATION_RULES", validator_rules)
  
  # Return the created class
  validator_class
end

# Usage
validator_name = "UserRegistration"
validator_rules = { username: /\A\w+\z/, email: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
validator_class = create_dynamic_validator_class(validator_name, validator_rules)

user_data = { username: "user123", email: "user@example.com" }

if validator_class.new.validate(user_data)
  puts "Data is valid!"
else
  puts "Validation errors:"
  puts validator_class.new.errors
end