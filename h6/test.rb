require 'benchmark'
require_relative 'fibonacci_numbers_generator'
require_relative 'reqc'


n=10000
	puts Benchmark.measure { 100.times{ RecursiveFibonacci.find_nth(n) }}
	puts Benchmark.measure { 100.times {FibonacciNumbersGenerator.find_nth(n) }}
