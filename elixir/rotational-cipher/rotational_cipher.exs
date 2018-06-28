defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn char_code -> shift_char(char_code, shift) end)
    |> to_string
  end

  def shift_char(char_code, shift) when char_code in ?A..?Z do
    rem(char_code + shift - ?a, 26)
  end

  def shift_char(char_code, shift) when char_code in ?a..?z do
    rem(char_code + shift - ?a, 26)
  end

  def shift_char(char_code, _) do
    char_code
  end
end
