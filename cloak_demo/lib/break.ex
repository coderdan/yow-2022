defmodule Break do
  @alpha ["A", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P", "Q", "R", "T", "U", "V", "W", "X", "Y"]
  @alpha_num [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ++ @alpha

  def medicare(target_hash) do
    for n1 <- 1..9,
      n2 <- 0..9,
      n3 <- @alpha_num,
      n4 <- 0..9,
      n5 <- @alpha,
      n6 <- @alpha_num,
      n7 <- 0..9 do
      #n8 <- @alpha,
      #n9 <- @alpha,
      #n10 <- 0..9,
      #n11 <- 0..9 do
        :crypto.hash(:sha256, "#{n1}#{n2}#{n3}#{n4}#{n5}#{n6}#{n7}") ##{n8}#{n9}#{n10}#{n11}")
    end
    nil
  end

  def names do
    "../names.csv"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> CSV.decode!
    |> Enum.flat_map(fn [name, _] ->
      IO.puts "Checking #{name}"
      hash = :crypto.hash(:sha256, name)

      case CloakDemo.Repo.get_by(CloakDemo.User, first_name_hash: hash) do
        nil -> []
        user -> [user]
      end
    end)
  end
end
