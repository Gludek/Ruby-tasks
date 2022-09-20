class FibonacciNumbersGenerator
  def self.find_nth(n)
    return 1 if n==1 || n==2

    last_number = 0
    nth_number = 1
    (n - 1).times do
      temp_value = nth_number + last_number
      last_number = nth_number
      nth_number = temp_value
    end
    nth_number

    # p1 = 0
    # p2= 0
    # 0.upto(Float::INFINITY).lazy.map { |x| x<=1 ? x : x=p1+p2; p2=p1; p1=x }.first(n+1).last
  end
end
