require "./2ndHomework.rb"

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


