class ManipulateString

  def add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)

    return 0 if numbers.empty?

    delimeters = ["\n", ",", "//"]

    if numbers.start_with?("//")
      delimeter_section, _ = numbers.split("\n", 2)
      delimeters << delimeter_section.gsub("//", "")
    end

    num_list = [numbers]

    delimeters.each do |delimiter|
      num_list = num_list.map{|num| num.split(delimiter)}.flatten.compact
    end

    ## invalidate or raise error when non string is provided
    if num_list.any? { |n| n.to_s !~ /^-?\d+$/ }
      raise ArgumentError, "Invalid input format: Only numbers are allowed"
    end

    num_list = num_list.map(&:to_i)

    return num_list.sum
  end
end