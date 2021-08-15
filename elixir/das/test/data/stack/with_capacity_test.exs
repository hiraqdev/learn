defmodule StackWithCapacityTest do
  use ExUnit.Case
  doctest Stack.WithCapacity

  alias Stack.WithCapacity, as: Stacker

  test "push success" do
    stack =
      Stacker.new(3)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)

    assert stack.capacity == 3
    assert length(stack.elements) == 3
    assert stack.top == 2

    assert Stacker.is_full?(stack)
    assert !Stacker.is_empty?(stack)
  end

  test "push raise an error" do
    {result, _} =
      Stacker.new(2)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)

    assert result == :error
  end

  test "pop success" do
    {result, val, _} =
      Stacker.new(3)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)
      |> Stacker.pop()

    assert result == :ok
    assert val == 3
  end

  test "pop error due to empty" do
    {result, _} =
      Stacker.new(1)
      |> Stacker.pop()

    assert result == :error
  end

  test "peek succcess" do
    val =
      Stacker.new(3)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)
      |> Stacker.peek()

    assert val == 3
  end

  test "peek is error" do
    {result, _} =
      Stacker.new(1)
      |> Stacker.peek()

    assert result == :error
  end
end
