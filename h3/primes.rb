def nth_prime(nth)
	primes=[2]
	i=1
	iterator=1
	until primes.length==nth
		n=2*iterator+1
		isprime=true
		primes.each do |prime|
			  break if prime**2>n
			  if (n%prime)==0
				isprime=false 
				break
			  end
		end
		if isprime==true
			primes<<n 
			i+1
		end
		iterator+=1
	end
	primes[-1]
end
def nth_prime_sqrt(nth)
	primes=[2]
	i=1
	iterator=1
	until primes.length==nth
		n=2*iterator+1
		isprime=true
		primes.each do |prime|
			  break if prime>Math.sqrt(n)
			  if (n%prime)==0
				isprime=false 
				break
			  end
		end
		if isprime==true
			primes<<n 
			i+1
		end
		iterator+=1
	end
	primes[-1]
end
def nth_prime_sqrt_r(nth)
	primes=[2]
	i=1
	iterator=1
	until primes.length==nth
		n=2*iterator+1
		isprime=true
		sqrtn=Math.sqrt(n)
		primes.each do |prime|
			  break if prime>sqrtn
			  if (n%prime)==0
				isprime=false 
				break
			  end
		end
		if isprime==true
			primes<<n 
			i+1
		end
		iterator+=1
	end
	primes[-1]
end
def nth_prime_k(nth)
	primes=[2]
	i=1
	iterator=1
	until primes.length==nth
		n=2*iterator+1
		isprime=true

		primes.each do |prime|
			  if (n%prime)==0
				isprime=false 
				break
			  end
		end
		if isprime==true
			primes<<n 
			i+1
		end
		iterator+=1
	end
	primes[-1]
end
def nth_prime_p(nth)
	primes=[2]
	i=1
	n=3
	until primes.length==nth
		isprime=true
		primes.each do |prime|
			  
			  if (n%prime)==0
				isprime=false 
				break
			  end
		end
		if isprime==true
			primes<<n 
			i+1
		end
		n+=1
	end
	primes.last
end
require 'benchmark'
# puts nth_prime(10001)
# puts "Moje kazde n"
# puts "\t\t\t\tuser     system      total        real"
# (0..3).each do |i|
# 	n=2**i * 100
# 	nt="#{n}".ljust(7)
# 	print "#{i+1}\tn=#{nt}\t"
# 	puts Benchmark.measure {
# 		(1000).times do
# 			nth_prime_p(n)
# 		end
# 	  }
# end
# puts "-"*100
x=5
puts "Moje nieparzyste poniżej sqrt(n) z użyciem potęgowania"
puts "\t\t\t\tuser     system      total        real"
(0..x).each do |i|
	n=2**i * 100
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(1000).times do
			nth_prime(n)
		end
	  }
end
puts "-"*100
puts "Moje nieparzyste poniżej sqrt(n) z użyciem sqrt wielokrotnie"
puts "\t\t\t\tuser     system      total        real"
(0..x).each do |i|
	n=2**i * 100
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(1000).times do
			nth_prime_sqrt(n)
		end
	  }
end
puts "-"*100
puts "Moje nieparzyste poniżej sqrt(n) z użyciem sqrt raz"
puts "\t\t\t\tuser     system      total        real"
(0..x).each do |i|
	n=2**i * 100
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(1000).times do
			nth_prime_sqrt_r(n)
		end
	  }
end
puts "-"*100