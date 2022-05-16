defmodule Yow do
  # Decrypts the target Ciphertext that has been decrypted
  # with AES-GCM and a repeated IV
  def break!(my_pt, my_ct, target) do
    my_pt
    |> :crypto.exor(my_ct)
    |> :crypto.exor(target)
  end
end
