defmodule ExCheck.SampleTest do
  use ExUnit.Case, async: false
  use ExCheck

  property :square do
    for_all x in int(), do: x * x >= 0
  end

  property :implies do
    for_all x in int() do
      #implies skip samples that does not satisfy the predicate. Also, it prints x when skip a sample
      implies x >= 0 do
        x >= 0
      end
    end
  end
end
