defmodule Yow do
  import Yow.Util
  @tag_size 12

  # WARNING: Don't ever do this - this is to demonstrate the dangers of repeated IVs
  @fixed_iv <<211, 101, 83, 38, 102, 147, 89, 183, 138, 126, 253, 174, 91, 28, 233, 100>>

  def encrypt(key, message) do
    case :crypto.block_encrypt(:aes_128_gcm, key, @fixed_iv, {"", message, @tag_size}) do
      {ct, _tag} -> ct
      err -> err
    end
  end

  def break!(my_pt, my_ct, target) do
    my_pt
    |> binary_xor(my_ct)
    |> binary_xor(target)
  end
end
