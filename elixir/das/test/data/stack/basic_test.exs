defmodule StackBasicTest do
  use ExUnit.Case

  test "push and pop" do
    {result, val, stack} =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.push(2)
      |> Stack.Basic.push(3)
      |> Stack.Basic.pop!()

    assert result == :ok
    assert val == 3
    assert length(stack) == 2

    [val1, val2] = stack
    assert val1 == 2
    assert val2 == 1
  end

  test "pop error" do
    assert_raise ArgumentError, fn ->
      Stack.Basic.pop!([])
    end
  end

  test "push, pop, and using" do
    {_, _, stack} =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.push(2)
      |> Stack.Basic.push(3)
      |> Stack.Basic.pop!()

    {_, val, stack2} =
      Stack.Basic.using(stack)
      |> Stack.Basic.push(4)
      |> Stack.Basic.pop!()

    assert val == 4

    [val1, val2] = stack2
    assert val1 == 2
    assert val2 == 1
  end

  test "push and peek" do
    val =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.peek!()

    assert val == 1
  end

  test "peek error" do
    assert_raise ArgumentError, fn ->
      Stack.Basic.peek!([])
    end
  end

  test "isEmpty" do
    empty? =
      Stack.Basic.new()
      |> Stack.Basic.isEmpty?()

    assert empty?

    empty2? =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.isEmpty?()

    assert !empty2?
  end
end
