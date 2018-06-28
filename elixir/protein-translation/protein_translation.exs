defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @codon_to_protein %{
    UGU: "Cysteine",
    UGC: "Cysteine",
    UUA: "Leucine",
    UUG: "Leucine",
    AUG: "Methionine",
    UUU: "Phenylalanine",
    UUC: "Phenylalanine",
    UCU: "Serine",
    UCC: "Serine",
    UCA: "Serine",
    UCG: "Serine",
    UGG: "Tryptophan",
    UAU: "Tyrosine",
    UAC: "Tyrosine",
    UAA: "STOP",
    UAG: "STOP",
    UGA: "STOP"
  }

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    protein =
      rna
      |> String.graphemes
      |> Enum.chunk_every(3)
      |> Enum.map(&(of_codon_val(&1)))
      |> Enum.take_while(fn(x) -> x != "STOP" end)
      case Enum.member?(protein, nil) do
        true  -> {:error, "invalid RNA"}
        false -> {:ok, protein}
      end
  end

  def of_codon_val(codon) do
    val = codon |> to_string |> of_codon
    case val do
      {:ok, value} -> value
      _            -> nil
    end
  end

  def of_codon(codon) do
    protein = @codon_to_protein[String.to_atom(codon)]
    case protein do
      nil   -> {:error, "invalid codon"}
      value -> {:ok, value}
    end
  end

end
