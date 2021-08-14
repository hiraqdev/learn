defmodule QueueBasicTest do
  use ExUnit.Case

  test "enqueue and get front and rear" do
    q =
      Queue.Basic.new()
      |> Queue.Basic.enqueue(1)
      |> Queue.Basic.enqueue(2)
      |> Queue.Basic.enqueue(3)

    front = Queue.Basic.peek(q)
    rear = Queue.Basic.last(q)

    assert 1 == front
    assert 3 == rear
    assert 3 == Queue.Basic.last(q)
  end

  test "dequeue" do
    q =
      Queue.Basic.new()
      |> Queue.Basic.enqueue(1)
      |> Queue.Basic.enqueue(2)
      |> Queue.Basic.enqueue(3)
      |> Queue.Basic.dequeue

    front = Queue.Basic.peek(q)
    rear = Queue.Basic.last(q)

    assert 2 == front
    assert 3 == rear
    assert 2 == Queue.Basic.size(q)
  end
end
