# frozen_string_literal: true

class MyQueue
  attr_reader :capacity

  def initialize(capacity: 10, type: 'fifo')
    @type = type
    @capacity = capacity
    @queue = []
  end

  def empty?
    @queue.empty?
  end

  def size
    @queue.size
  end

  def full?
    size == capacity
  end

  def peek
    @queue.first
  end

  def push(element)
    return false if full?

    @type == 'fifo' ? @queue.push(element) : @queue.unshift(element)
    true
  end

  def pop
    @queue.pop unless empty?
  end
end
