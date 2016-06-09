list = Enum.to_list(1..1_000)
quick_map = fn n -> n*2 end
slow_map = fn n ->
  :timer.sleep(1)
  n*2
end

Benchee.run(
  %{time: 3},
  [
    {"quick pmap", fn -> Parallel.map(list, quick_map) end},
    {"quick map", fn -> Enum.map(list, quick_map) end},
  ]
)
Benchee.run(
  %{time: 3},
  [
    {"slow pmap", fn -> Parallel.map(list, slow_map) end},
    {"slow map", fn -> Enum.map(list, slow_map) end},
  ]
)
