defmodule Queue.Basic do
  @moduledoc """
  Queue.Basic used basic list as data storage
  and Enum to reverse the list.  The cons of these
  operations is we are using Enum.reverse to reverse
  the list to get the "front"
  """

  @doc """
  Initialize new queue using list
  """
  @spec new() :: list()
  def new do
    []
  end

  @doc """
  Put the given value to the list
  """
  @spec enqueue(list(), any()) :: list()
  def enqueue(q, value) do
    [ value | q ]
  end

  @doc """
  Remove first element on queue
  """
  @spec dequeue(list()) :: list()
  def dequeue(q) do
    Enum.reverse(q)
    |> tl
    |> Enum.reverse
  end

  @doc """
  Get the "front" element from the queue
  """
  @spec peek(list()) :: any()
  def peek(q) do
    Enum.reverse(q)
    |> hd
  end

  @doc """
  Get the "rear" element from the queue
  """
  @spec last(list()) :: any()
  def last(q), do: hd(q)

  @doc """
  Get current queue size
  """
  @spec size(list()) :: number()
  def size(q), do: length(q)
end
