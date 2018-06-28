# Please implement your solution to rna-transcription in this file
module RnaComplement
  NUCLEOTIDES = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
  }

  def self.of_dna(nucleotide)
    nucleotide.chars.reduce("") do |acc, r|
      acc + NUCLEOTIDES[r]
    end
  end
end
