def well_formed?(str)
  braces = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }
  opens = braces.keys.to_set

  stack = []

  str.each_char do |ch|
    if opens.include?(ch)

    else
      return false
    end
  end

end
