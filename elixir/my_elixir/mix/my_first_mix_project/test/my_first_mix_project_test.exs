defmodule MyFirstMixProjectTest do
  use ExUnit.Case
  doctest MyFirstMixProject

  test "greets the world" do
    assert MyFirstMixProject.hello() == :world
  end
end
