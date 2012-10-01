class Array
  def match_numeric_range_with_value(value)
    return nil if value.blank?
    value = value.to_i
    self.each do |range|
      low_range, high_range =  range.split "-"
      low_range = low_range.to_i
      high_range = high_range.to_i
      high_range = Float::INFINITY if high_range == 0
      return range if value >= low_range && value <= high_range
    end
  end


end