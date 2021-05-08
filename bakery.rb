# frozen_string_literal: true

require './bakery_functions'

# add another case when adding bread
def determine_bread(code)
  case code
  when /VS5/
    variables = [5, 3]
    price = [8.99, 6.99]
  when /MB11/
    variables = [8, 5, 2]
    price = [24.95, 16.95, 9.95]
  when /CF/
    variables = [9, 5, 3]
    price = [16.99, 9.95, 5.95]
  else
    raise InvalidBreadCode
  end
  [variables, price]
end
