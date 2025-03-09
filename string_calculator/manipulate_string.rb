class ManipulateString

  def add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)

    return 0 if numbers.empty?

    num_list = [numbers]

    if num_list.any? { |n| n.to_s !~ /^-?\d+$/ }
      raise ArgumentError, "Invalid input format: Only numbers are allowed"
    end
    num_list = num_list.map(&:to_i)

    return num_list.sum
  end
end