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
    puts "#{code}, Your total is $#{(multiply_array(price, solution) * 100).round / 100.0}"
    puts('BREAKDOWN')
    (0..solution.length - 1).each do |x|
      puts "#{solution[x]} x #{variables[x]} pack = $#{(solution[x] * price[x] * 100).round / 100.0}"
    end
    (multiply_array(price, solution) * 100).round / 100.0
  end
  
  class Bread
    attr_reader :code, :variables, :price
    def initialize(code, variables, price)
      @code = code
      @variables = variables
      @price = price
    end
  end

  class InvalidBreadCode < StandardError
    def initialize(msg="The code you entered is invalid", exception_type="custom")
      @exception_type = exception_type
      super(msg)
    end
  end