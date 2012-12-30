require "./1stHomework.rb"

class Test
  def Test.ok(expected, actual, string = nil)
    success = (expected == actual)
    if success then
      puts "\033[42mok\033[0m"
      return
    else
      puts "\033[41mfailed"
      puts string if string
      puts "Expected #{expected}, Actual #{actual}"
      puts caller.join "\n"
      puts "\033[0m"
      exit(1)
    end
  end
end

Test.ok([2, 3], 12.prime_divisors)
Test.ok([2], 4.prime_divisors, "sqare numbers")
Test.ok(20.prime_divisors, -20.prime_divisors, "negative number")
Test.ok([2, 3, 5], 120.prime_divisors)

Test.ok([1, 2, :fizz], (1..3).fizzbuzz, "1-3")
Test.ok([1, 2, :fizz, 4, :buzz], (1..5).fizzbuzz, "1-5")
Test.ok([13, 14, :fizzbuzz, 16], (13..16).fizzbuzz, "13-16")
Test.ok([8, :fizz, :buzz], (8..10).fizzbuzz, "8-10")

Test.ok({1 => [:a]}, {a: 1}.group_values)
Test.ok({1 => [:a, :c], 2 => [:b]}, {a: 1, b: 2, c: 1}.group_values)

Test.ok([1, 1, 1], [:a, :b, :c].densities)
Test.ok([2, 1, 2], [:a, :b, :a].densities)
Test.ok([3, 3, 3], [:a, :a, :a].densities)
