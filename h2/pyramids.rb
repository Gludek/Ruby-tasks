require 'benchmark'

def visible_pyramids(p)
    n = p.length
    visible_left = 1
    max_left = p[0]
    visible_right = 1
    max_right = p[n-1]
    (1..n-1).each do |i|
		if p[i] > max_left
			visible_left += 1
			max_left = p[i] 
		end
		if p[n-1-i] > max_right
			visible_right += 1
			max_right = p[n-1-i] 
		end
		break if max_left == n && max_right == n
    end
    { left: visible_left, right: visible_right }
end
def visible_pyramids_side(p)
    n = p.length
    visible = 1
    max = p[0]
    (1..n-1).each do |i|
		if p[i] > max
			visible += 1
			max = p[i]
		end
		break if max == n
    end
    visible
end
def pyramids_both(p)
	{ left: visible_pyramids_side(p), right: visible_pyramids_side(p.reverse) }
end
def count_m(array)
	numbers = [array.first]
	highest = array.max
  
	array.drop(1).each do |el|
	  numbers.last < el ? numbers.push(el) : ''
	  break if el == highest
	end
	numbers.size
end
  
def pyramids_max(array)
	[[:left, count_m(array)], [:right, count_m(array.reverse)]].to_h
end
def count_l(array)
	numbers = [array.first]
	highest = array.length
  
	array.drop(1).each do |el|
	  numbers.last < el ? numbers.push(el) : ''
	  break if el == highest
	end
	numbers.size
end
  
def pyramids_length(array)
	[[:left, count_l(array)], [:right, count_l(array.reverse)]].to_h
end
n=5
p=(1..n).to_a.shuffle
puts p.inspect
puts pyramids_both(p).inspect
puts "Moje visible_pyramids"
puts "\t\t\t\tuser     system      total        real"
(0..5).each do |i|
	n=2**i * 1000
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(10_000).times do
			p=(1..n).to_a.shuffle
			visible_pyramids(p)
		end
	  }
end
puts "-"*100

puts "Moje pyramids_both"
puts "\t\t\t\tuser     system      total        real"
(0..5).each do |i|
	n=2**i * 1000
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(10_000).times do
			p=(1..n).to_a.shuffle
			pyramids_both(p)
		end
	  }
end
puts "-"*100
puts "Monka max"
puts "\t\t\t\tuser     system      total        real"
(0..5).each do |i|
	n=2**i * 1000
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(10_000).times do
			p=(1..n).to_a.shuffle
			pyramids_max(p)
		end
	  }
end
puts "-"*100
puts "Monka length"
puts "\t\t\t\tuser     system      total        real"
(0..5).each do |i|
	n=2**i * 1000
	nt="#{n}".ljust(7)
	print "#{i+1}\tn=#{nt}\t"
	puts Benchmark.measure {
		(10_000).times do
			p=(1..n).to_a.shuffle
			pyramids_length(p)
		end
	  }
end