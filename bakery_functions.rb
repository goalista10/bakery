# frozen_string_literal: true

def multiply_array(variables, solution)
  sum = 0
  (0..variables.length - 1).each do |x|
    sum += (variables[x] * solution[x])
  end
  sum
end

def calculate(number, variables, solution, ctr, orig_number)
  if ctr != variables.length - 1
    ctr += 1
    a = variables[ctr]
    r = (number / a)..0
    (r.first).downto(r.last).each do |x|
      solution[ctr] = x
      ret = calculate(number - (a * x), variables, solution, ctr, orig_number)
      return ret if ret.instance_of?(Array)
    end
  elsif (multiply_array(variables, solution)) == orig_number
    solution
  end
end

def print_receipt(variables, price, solution, code)
  puts ''
  puts "#{code}, Your total is $#{(multiply_array(price, solution)).round(2)}"
  puts('BREAKDOWN')
  (0..solution.length - 1).each do |x|
    puts "#{solution[x]} x #{variables[x]} pack = $#{(solution[x] * price[x]).round(2)}"
  end
  (multiply_array(price, solution)).round(2)
end

# Custom error for invalid code
class InvalidBreadCode < StandardError
  def initialize(msg = 'The code you entered is invalid', exception_type = 'custom')
    @exception_type = exception_type
    super(msg)
  end
end

def decode(code)
  number = code.match(/\d+/).to_s.to_i
  variables, price = determine_bread(code)
  solution = Array.new(variables.length, 0)
  total = print_receipt(variables, price, calculate(number, variables, solution, -1, number), code)
  [calculate(number, variables, solution, -1, number), variables, total]
end
