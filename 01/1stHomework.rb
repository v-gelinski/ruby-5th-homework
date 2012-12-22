class Integer 
  def get_divisors
    divisors = []
    possible_divisors = *(1..Math.sqrt(self))
    possible_divisors.each do |n|
      if self % n == 0
        divisors << n
        divisors << self / n
      end
    end
    divisors
  end

  def is_prime?
    self != 1 &&  [1, self] == self.get_divisors
  end

  def prime_divisors
    divisors = self.get_divisors
    prime_divisors = []
    divisors.each { |divisor| prime_divisors << divisor if divisor.is_prime?}
    prime_divisors
  end
end

class Range
  def fizzbuzz
    fizzbuzz_array = []
    self.to_a.each do |n|
      next_member = n
      next_member = :fizz if n % 3 == 0
      next_member = :buzz if n % 5 == 0
      #Important! next line shoud be the last check, do not move it up!
      next_member = :fizzbuzz if n % 15 == 0
      fizzbuzz_array << next_member
    end
    fizzbuzz_array
  end
end

class Hash
  def group_values
    ret = {} #empty Hash
    self.each do |key, value|
      if ret.has_key? value 
        ret[value] << key
      else
        #tmp used for debugging reasons, no other sence
        tmp = {value => [key]}
        ret = ret.merge(tmp)
      end
    end
    ret
  end
end

class Array
  def densities
    holder = {} #emoty hash
    self.each do |n|
      if holder.has_key? n
        #increment with one
        count = holder[n]
        holder[n] = count + 1
      else
        #put in holder with value of one
        holder = holder.merge({n => 1})
      end
    end
    ret = [] #empty array
    self.each { |n| ret << holder[n]}
    ret
  end
end

