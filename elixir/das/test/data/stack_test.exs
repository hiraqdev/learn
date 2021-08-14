defmodule StackTest do
  defmodule WithListTest do
    use ExUnit.Case

    test "push and pop" do
      {result, val, stack} =
        Stack.WithList.new()
        |> Stack.WithList.push(1)
        |> Stack.WithList.push(2)
        |> Stack.WithList.push(3)
        |> Stack.WithList.pop!

      assert result == :ok
      assert val == 3
      assert length(stack) == 2

      [val1, val2] = stack
      assert val1 == 2
      assert val2 == 1
    end

    test "pop error" do
      assert_raise ArgumentError, fn ->
        Stack.WithList.pop!([])
      end
    end

    test "push, pop, and using" do
      {_, _, stack} =
        Stack.WithList.new()
        |> Stack.WithList.push(1)
        |> Stack.WithList.push(2)
        |> Stack.WithList.push(3)
        |> Stack.WithList.pop!

      {_, val, stack2} =
        Stack.WithList.using(stack)
        |> Stack.WithList.push(4)
        |> Stack.WithList.pop!

      assert val == 4

      [val1, val2] = stack2
      assert val1 == 2
      assert val2 == 1
    end

    test "push and peek" do
      val =
        Stack.WithList.new()
        |> Stack.WithList.push(1)
        |> Stack.WithList.peek!

      assert val == 1
    end

    test "peek error" do
      assert_raise ArgumentError, fn ->
        Stack.WithList.peek!([])
      end
    end

    test "isEmpty" do
      empty? =
        Stack.WithList.new()
        |> Stack.WithList.isEmpty?

      assert empty?

      empty2? =
        Stack.WithList.new()
        |> Stack.WithList.push(1)
        |> Stack.WithList.isEmpty?

      assert !empty2?
    end
  end
end
