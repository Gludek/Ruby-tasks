module AdapterPattern
  require_relative 'client'
  require_relative 'adapter'
  require_relative 'source_one'
  require_relative 'source_two'

  client = Client.new(SourceTwo.new, Adapter.new(SourceOne.new))
  client.extract
  client.print
end
