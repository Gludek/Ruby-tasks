module AdapterPattern
  class Client
    def initialize(*sources)
      @sources = sources
      @data = []
    end

    def extract
      @data=@sources.map(&:extract)
    end

    def print
      @data.each { |data| puts data }
    end
  end
end