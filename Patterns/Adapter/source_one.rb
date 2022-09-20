module AdapterPattern
  class SourceOne
    attr_reader :data

    require 'rexml/document'
    include REXML

    def initialize
      @file = File.new('data_one.xml')
    end

    def extract
      @data = Document.new(@file)
    end
  end
end
