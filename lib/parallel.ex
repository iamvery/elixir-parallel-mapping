defmodule Parallel do
  @doc """
  Parallel map

      iex> Parallel.map([1,2,3], &(&1*2))
      [2,4,6]
  """
  def map(collection, function) do
    collection
    |> Enum.map(&Task.async(fn -> function.(&1) end))
    |> Enum.map(&Task.await(&1))
  end

  @doc """
  Unordered parallel map

      iex> results = Parallel.omap([1,2,3], &(&1*2))
      iex> Enum.member?(results, 2)
      true
      iex> Enum.member?(results, 4)
      true
      iex> Enum.member?(results, 6)
      true
  """
  def omap(collection, function) do
    me = self
    collection
    |> Enum.map(&spawn_link(fn -> send(me, function.(&1)) end))
    |> Enum.map(fn _pid -> receive do: (result -> result) end)
  end

  @doc """
  Streamed parallel map (whoops, don't do this!)

  Streaming is a really bad idea, because it requires each to finish before
  starting the next effectively underminding the parallelism entirely.

      iex> Parallel.smap([1,2,3], &(&1*2))
      [2,4,6]
  """
  def smap(collection, function) do
    collection
    |> Stream.map(&Task.async(fn -> function.(&1) end))
    |> Enum.map(&Task.await(&1))
  end
end
