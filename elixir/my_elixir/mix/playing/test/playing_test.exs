defmodule PlayingTest do
  use ExUnit.Case
  doctest Playing

  test "greets the world" do
    assert Playing.hello() == :world
  end
end
