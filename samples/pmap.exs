small_list = Enum.to_list(1..100)
med_list = Enum.to_list(1..1_000)
big_list = Enum.to_list(1..10_000)
map_fun = &(&1*2)

Benchee.run(
  %{time: 3},
  [
    {"S multiple map calls", fn -> Parallel.map(small_list, map_fun) end},
    {"S orderless map", fn -> Parallel.omap(small_list, map_fun) end},
    {"S streamed map calls", fn -> Parallel.smap(small_list, map_fun) end},
  ]
)
Benchee.run(
  %{time: 3},
  [
    {"M multiple map calls", fn -> Parallel.map(med_list, map_fun) end},
    {"M orderless map", fn -> Parallel.omap(med_list, map_fun) end},
    {"M streamed map calls", fn -> Parallel.smap(med_list, map_fun) end},
  ]
)
Benchee.run(
  %{time: 3},
  [
    {"L multiple map calls", fn -> Parallel.map(big_list, map_fun) end},
    {"L orderless map", fn -> Parallel.omap(big_list, map_fun) end},
    {"L streamed map calls", fn -> Parallel.smap(big_list, map_fun) end},
  ]
)
