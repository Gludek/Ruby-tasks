module AdapterPattern
  class Adapter
    require 'rexml/document'
    include REXML
    require 'json'

    def initialize(data_source)
      @data_source = data_source
    end

    def extract
      data_hash = {}
      xmldoc = @data_source.extract
      root = xmldoc.root
      root.elements.each { |element| data_hash[element.name] = element.text }
      JSON.generate(data_hash)
    end
  end
end
