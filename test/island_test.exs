defmodule IslandsEngine.IslandTest do
  use ExUnit.Case, async: true
  doctest IslandsEngine.Island
  alias IslandsEngine.{Island, Coordinate}

  test "creates new island" do
    {:ok, coordinate} = Coordinate.new(4, 4)
    {:ok, island} = Island.new(:dot, coordinate)
    assert nil != island
  end

  test "properly measures misses" do
    {:ok, coordinate} = Coordinate.new(4, 4)
    {:ok, island} = Island.new(:dot, coordinate)
    {:ok, guess_coordinate} = Coordinate.new(2, 2)
    assert :miss == Island.guess(island, guess_coordinate)
  end

  test "properly measures hits" do
    {:ok, coordinate} = Coordinate.new(4, 4)
    {:ok, island} = Island.new(:dot, coordinate)
    {:ok, guess_coordinate} = Coordinate.new(4, 4)
    {blah, _} = Island.guess(island, guess_coordinate)
    # assert {:hit, _} == Island.guess(island, guess_coordinate)
    assert :hit == blah
  end
end
