defmodule YowTest do
  use ExUnit.Case
  doctest Yow

  test "greets the world" do
    assert Yow.hello() == :world
  end
end
