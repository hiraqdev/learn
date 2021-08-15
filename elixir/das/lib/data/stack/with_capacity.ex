defmodule Stack.WithCapacity do
  @moduledoc """
  Stack.WithCapacity is just like Stack.Basic but with more
  functionality including to check if stack is empty or not
  """

  defmodule StackObject do
    @moduledoc """
    StackObject is a struct which contains stack's metadata fields
    """

    @enforce_keys [:capacity]
    defstruct [:capacity, top: -1, elements: []]
  end

  alias Stack.WithCapacity.StackObject, as: StackObject

  @doc """
  Used to initialize new stack by adding it's capacity

  ## Parameters

    - cap: Maximal capacity this current stack can contained

  ## Example

    ```elixir
    # means create new stack with maximum capacity to contain five elements
    stack = Stack.WithCapacity.new(5)
    ```
  """
  @spec new(number()) :: %StackObject{capacity: number(), top: number()}
  def new(cap) do
    %StackObject{capacity: cap}
  end

  def push(stack, _) when length(stack.elements) == stack.capacity, do: {:error, "Stakc is full"}

  @doc """
  Used to adding new value to the stack

  ## Parameters

    - stack: Given running stack
    - val: Any value type

  ## Example

    ```elixir
    stack =
      Stack.WithCapacity.new(3)
      |> Stack.WithCapacity.push(1)
      |> Stack.WithCapacity.push(2)
    ```
  """
  @spec push(%StackObject{}, any()) :: %StackObject{}
  def push(stack, val) do
    %StackObject{stack | elements: [val | stack.elements], top: stack.top + 1}
  end

  def pop(stack) when stack.top == -1, do: {:error, "Stack is empty"}

  @doc """
  Used to get latest added value to the stack and also remove it from stack,
  return the value and also the stack

  ## Parameters

    - stack: Given running stack

  ## Example

    ```elixir
    {result, val, _} =
      Stacker.new(3)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)
      |> Stacker.pop()
    ```
  """
  @spec pop(%StackObject{}) :: {term(), any(), %StackObject{}}
  def pop(stack) do
    {:ok, hd(stack.elements),
     %StackObject{stack | elements: tl(stack.elements), top: stack.top - 1}}
  end

  @doc """
  Used to check if current given stack is empty or not
  """
  @spec is_empty?(%StackObject{}) :: boolean()
  def is_empty?(stack) do
    stack.top == -1
  end

  @doc """
  Used to check if current given stack is full or not
  """
  @spec is_full?(%StackObject{}) :: boolean()
  def is_full?(stack) do
    stack.capacity == length(stack.elements)
  end

  def peek(stack) when stack.top == -1, do: {:error, "Stack is empty"}

  @doc """
  Used to get latest added value from the stack without remove it from stack

  ## Parameters

    - stack: Given running stack

  ## Example

    ```elixir
    val =
      Stacker.new(3)
      |> Stacker.push(1)
      |> Stacker.push(2)
      |> Stacker.push(3)
      |> Stacker.peek()
    ```
  """
  @spec peek(%StackObject{}) :: any()
  def peek(stack) do
    hd(stack.elements)
  end
end
