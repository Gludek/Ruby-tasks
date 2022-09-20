def letters(word)
  chars = word.chars.map
  hash = Hash[chars.uniq.collect { |char| [char.to_sym, []] }]
  chars.each_with_index do |char, index|
    hash[char.to_sym] << index
  end
  hash
end

h = letters('dodo')
puts h.inspect
