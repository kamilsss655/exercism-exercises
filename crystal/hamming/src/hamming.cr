# Please implement your solution to hamming in this file
class Hamming
  def self.compute(s1 : String, s2 : String)
    raise ArgumentError.new if s1.size != s2.size
    s1.chars.zip(s2.chars)
      .count {|b1, b2| b1 != b2}
  end
end
