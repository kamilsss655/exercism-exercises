defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.count(&(&1 == nucleotide))
  end

  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    strand
    |> Enum.reduce(empty_census(), &nucleotide_counts/2)
  end

  @spec nucleotide_counts(char, Dict.t) :: Dict.t
  defp nucleotide_counts(nucleotide, census) do
    census
    |> Map.update!(nucleotide, &(1 + &1))
  end

  @spec empty_census() :: Dict.t
  defp empty_census do
    @nucleotides
    |> Enum.into(%{}, &({&1, 0}))
  end

end
