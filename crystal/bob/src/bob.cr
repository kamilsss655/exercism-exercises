# Please implement your solution to bob in this file

module Bob
  def Bob.hey(utterance)
    if shouting?(utterance)
      "Whoa, chill out!"
    elsif asking?(utterance)
      "Sure."
    elsif silence?(utterance)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  def self.shouting?(utterance)
    /[A-Z]/ =~ utterance && /[a-z]/ !~ utterance
  end

  def self.asking?(utterance)
    utterance.ends_with? '?'
  end

  def self.silence?(utterance)
    /^\s*$/ =~ utterance
  end
end
