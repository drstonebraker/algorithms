class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    mapped = self.map do |el|
      if el.is_a?(Hash)
        el.hash
      else
        el
      end
    end

    'Array'.concat(mapped.inspect).hash
  end
end

class String
  def hash
    mapped = ('String'.concat(self)).chars.map.with_index do |ch, idx|
      (idx.to_s.concat(ch.ord.to_s)).to_i.hash
    end
    mapped.inject(:^)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    'Hash'.concat(self.to_a.sort.hash.to_s).hash
  end
end
