defmodule Yow.Encrypt do
  # WARNING: Don't ever do this - this is to demonstrate the dangers of repeated IVs
  @fixed_iv <<211, 101, 83, 38, 102, 147, 89, 183, 138, 126, 253, 174, 91, 28, 233, 100>>

  def encrypt(key, message) do
    case :crypto.crypto_one_time_aead(:aes_128_gcm, key, @fixed_iv, message, "", true) do
      {ct, _tag} -> ct
      err -> err
    end
  end
end
