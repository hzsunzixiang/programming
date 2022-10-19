
defmodule Example do
  def sum(x, y) do
    x + y
  end
  def start(x) do
    :io.format("x+10:~p~n", [x])
  end
  def test() do
    :io.format("in test:~p~n", [10])
    109 + 10
  end
  def test_print(x) do
    :io.format("in test:~p~n", [x])
    109 + 10
  end
end
 
#IO.puts :hello


