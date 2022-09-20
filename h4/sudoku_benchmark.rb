require 'benchmark'
require_relative 'sudoku'
require_relative 'sudoku_copy'
input='250030901010004000407000208005200000000098100040003000000360072070000003903000604'
n=100000000
Benchmark.bm(7) do |x|
	x.report('Test') {SudokuT.new(input).solve}
	x.report('Org') {Sudoku.new(input).solve}
end