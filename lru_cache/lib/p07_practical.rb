require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  counts = HashMap.new

  string.each_char do |ch|
    counts[ch] = counts[ch] || 0
    counts[ch] += 1
  end

  ones_count = 0

  counts.each do |k, v|
    return false if v > 2
    ones_count += 1 if v == 1
    return false if ones_count > 1
  end

  true
end
