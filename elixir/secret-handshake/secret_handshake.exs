defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce([], fn value, acc -> decode_handshake(acc, value) end)
  end

  def decode_handshake(acc, {1, 0}), do: acc ++ ["wink"]
  def decode_handshake(acc, {1, 1}), do: acc ++ ["double blink"]
  def decode_handshake(acc, {1, 2}), do: acc ++ ["close your eyes"]
  def decode_handshake(acc, {1, 3}), do: acc ++ ["jump"]
  def decode_handshake(acc, {1, 4}), do: Enum.reverse(acc)
  def decode_handshake(acc, _), do: acc
end
