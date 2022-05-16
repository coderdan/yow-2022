defmodule Yow.Util do
  use Bitwise

  def binary_xor(a, b) do
    a
    |> binary_to_integer
    |> bxor(b |> binary_to_integer)
    |> integer_to_binary
  end

  def binary_to_integer(binary) do
    Enum.map(0..(byte_size(binary) - 1), fn i ->
      <<x::8>> = binary_part(binary, i, 1)
      x
    end)
    |> Integer.undigits(256)
  end

  def integer_to_binary(int) do
    Enum.reduce(Integer.digits(int, 256), <<>>, fn byte, acc ->
      acc <> <<byte::8>>
    end)
  end
end

