class Integer 
  def get_divisors
    divisors = []
    (1..Math.sqrt(self)).each do |n|
      if self % n == 0
        divisors << n
        divisors << self  / n if n** 2 != self
      end
    end
    divisors
  end

  def is_prime?
   self != 1 && [1, self] == get_divisors
  end

  def prime_divisors
    return (-self).prime_divisors if self < 0
    prime_divisors = []
    get_divisors.each { |divisor| prime_divisors << divisor if divisor.is_prime?}
    prime_divisors
  end
end

class Range
  def fizzbuzz
    map do |n|
      if(n % 3 == 0 && n % 5 == 0) then
        current_member = :fizzbuzz
      elsif(n % 3 == 0) then
        current_member = :fizz
      elsif(n % 5 == 0) then
        current_member = :buzz
      else 
        current_member = n
      end
      current_member
    end
  end
end

class Hash
  def group_values
    result = {} #empty Hash
    each do |key, value|
      if result.has_key? value 
        result[value] << key
      else
        result[value] = [key]
      end
    end
    result
  end
end

class Array
  def densities
    map { |n| count n }
  end
end
