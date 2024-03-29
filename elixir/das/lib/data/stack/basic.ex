defmodule Stack.Basic do
  @moduledoc """
  Stack.Basic used basic list operations
  to implement Stack data structure.  The benefit
  using basic list is just simple data structures & operations,
  the cons is, we cannot give MAX stack's size and also it just depends
  on list capabilities to manage the data itself
  """

  @doc """
  Initialize new stach values using list
  """
  @spec new() :: list()
  def new do
    []
  end

  @doc """
  Use given stack a list of values

  ## Parameters

    - stack: Given list of values

  ## Example

    ```elixir
    {_, stack} =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.push(2)
      |> Stack.Basic.pop

    newstack =
      Stack.Basic.using(stack)
      |> Stack.Basic.push(3)
      |> Stack.Basic.push(4)
    ```
  """
  @spec using(list()) :: list()
  def using(stack) do
    stack
  end

  @doc """
  Return top element value from stack without remove it,
  may raise an `ArgumentError` if given stack is empty

  ## Parameters

    - stack: Given list of any value types

  ## Example

    ```elixir
    val =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.push(2)
      |> Stack.Basic.peek!
    ```
  """
  @spec peek!(list()) :: any()
  def peek!(stack) when length(stack) >= 1 do
    hd(stack)
  end

  def peek!(stack) when length(stack) < 1, do: raise(ArgumentError, "Stack is empty")

  @doc """
  Check if given stack is empty or not

  ## Parameters

    - stack: Given list of any value types

  ## Example

    ```elixir
    val =
      Stack.Basic.new()
      |> Stack.Basic.push(1)
      |> Stack.Basic.isEmpty?
    ```
  """
  @spec isEmpty?(list()) :: boolean()
  def isEmpty?(stack) do
    length(stack) < 1
  end

  @doc """
  Adding new value into the stack

  ## Parameters

    - stack: Given list of values
    - value: Any value data type

  ## Example

    ```elixir
    Stack.Basic.new()
    |> Stack.Basic.push(1)
    |> Stack.Basic.push(2)
    ```
  """
  @spec push(list(), any()) :: list()
  def push(stack, value) do
    [value | stack]
  end

  @doc """
  Get top element and tail of given stack, may raise
  an ArgumentError if given stack is empty

  ## Parameters
    - stack : Given list of values

  ## Example

    ```elixir
    {val, stack} =
    Stack.Basic.new()
    |> Stack.Basic.push(1)
    |> Stack.Basic.push(2)
    |> Stack.Basic.pop
    ```
  """
  @spec pop!(list()) :: {term(), any(), list()}
  def pop!(stack) when length(stack) >= 1 do
    {:ok, hd(stack), tl(stack)}
  end

  def pop!(stack) when length(stack) < 1, do: raise(ArgumentError, message: "Stack is empty")
end
