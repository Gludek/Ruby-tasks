class RecursiveFibonacci
	def self.find_nth(n, acc=0, val=[0,1])
		return 1 if n==1 || n==2
		return val.last if acc==n-1
		val<<(val.shift+val.first)
		find_nth(n,acc+1,val)
	end
end