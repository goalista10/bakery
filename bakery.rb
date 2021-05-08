# frozen_string_literal: true
require './bakery_functions'

def determine_bread(code)
  vegemite_scroll = Bread.new("VS5",[5,3],[8.99, 6.99])
  blueberry_muffin = Bread.new("MB11",[8, 5, 2],[24.95, 16.95, 9.95])
  croissant = Bread.new("CF",[9, 5, 3],[16.99, 9.95, 5.95])
  
  number = code.match(/\d+/).to_s.to_i
  case code
  when /#{vegemite_scroll.code}/
    variables = vegemite_scroll.variables
    price = vegemite_scroll.price
  when /#{blueberry_muffin.code}/
    variables = blueberry_muffin.variables
    price = blueberry_muffin.price
  when /#{croissant.code}/
    variables = croissant.variables
    price = croissant.price
  else
    raise InvalidBreadCode
  end
  solution = Array.new(variables.length, 0)
  total = print_receipt(variables, price, calculate(number, variables, solution, -1, number), code)
  [calculate(number, variables, solution, -1, number), variables, total]
end
