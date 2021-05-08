# frozen_string_literal: true

def multiply_array(var, sol)
  sum = 0
  (0..var.length - 1).each do |x|
    sum += (var[x] * sol[x])
  end
  sum
end

def calculate(num, var, sol, ctr, orig_num)
  if ctr != var.length - 1
    ctr += 1
    a = var[ctr]
    r = (num / a)..0
    (r.first).downto(r.last).each do |x|
      sol[ctr] = x
      ret = calculate(num - (a * x), var, sol, ctr, orig_num)
      return ret if ret.instance_of?(Array)
    end
  elsif (multiply_array(var, sol)) == orig_num
    sol
  end
end

def print_receipt(var, price, sol, code)
  puts ''
  puts "#{code}, Your total is $#{(multiply_array(price, sol) * 100).round / 100.0}"
  puts('BREAKDOWN')
  (0..sol.length - 1).each do |x|
    puts "#{sol[x]} x #{var[x]} pack = $#{(sol[x] * price[x] * 100).round / 100.0}"
  end
  (multiply_array(price, sol) * 100).round / 100.0
end

def determine_bread(code)
  num = code.match(/\d+/).to_s.to_i
  case code
  when /VS5/
    var = [5, 3]
    price = [8.99, 6.99]
  when /MB11/
    var = [8, 5, 2]
    price = [24.95, 16.95, 9.95]
  when /CF/
    var = [9, 5, 3]
    price = [16.99, 9.95, 5.95]
  end
  sol = Array.new(var.length, 0)
  total = print_receipt(var, price, calculate(num, var, sol, -1, num), code)
  [calculate(num, var, sol, -1, num), var, total]
end
