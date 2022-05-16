defmodule Yow do
  import Yow.Util

  # Decrypts the target Ciphertext that has been decrypted
  # with AES-GCM and a repeated IV
  def break!(my_pt, my_ct, target) do
    my_pt
    |> binary_xor(my_ct)
    |> binary_xor(target)
  end
end
