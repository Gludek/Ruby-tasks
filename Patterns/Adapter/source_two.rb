module AdapterPattern
  class SourceTwo
    attr_reader :data

    require 'json'

    def initialize
      @file = File.new('data_two.json')
    end

    def extract
      @data = JSON.generate(JSON.load(@file))
    end
  end
end
