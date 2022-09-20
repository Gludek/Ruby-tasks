class Matrix
  attr_reader :matrix

  def initialize(input)
    @matrix = []
    row = []
    chars = input.delete(' ').chars
    chars.each_with_index do |char, i|
      row << char.to_i if char =~ /\d/
      if char =~ /\n/ || !chars[i + 1]
        @matrix << row
        row = []
      end
    end
    @matrix
  end

  def transpose
    return to_s if @matrix.length <= 1 && @matrix[0].length <= 1

    m_size = @matrix.length > @matrix[0].length ? @matrix.length : @matrix[0].length
    temp = Array.new(m_size) { Array.new(m_size) }
    @matrix.each.with_index do |row, row_index|
      row.each.with_index do |value, column_index|
        temp[column_index][row_index] = value
      end
    end
    @matrix = temp.map(&:compact).delete_if(&:empty?)
    to_s
  end

  def to_s
    matrix_string = ''
    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |value, column_index|
        matrix_string << value.to_s
        matrix_string << ' ' if column_index < row.size - 1 && @matrix[row_index][column_index + 1]
      end
      matrix_string << "\n" if row_index < @matrix.size - 1 && @matrix[row_index + 1].any?
    end
    matrix_string
  end
end
