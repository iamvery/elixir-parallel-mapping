# Parallel

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add parallel to your list of dependencies in `mix.exs`:

        def deps do
          [{:parallel, "~> 0.0.1"}]
        end

  2. Ensure parallel is started before your application:

        def application do
          [applications: [:parallel]]
        end

## Benchmarks

Run them:

```
$ mix run samples/pmap.exs
```

Here are my results:

```
● master ~/Code/OSS/parallel » mix run samples/pmap.exs
Benchmarking S multiple map calls...
Benchmarking S orderless map...
Benchmarking S streamed map calls...

Name                          ips            average        deviation      median
S orderless map               2512.35        398.03μs       (±17.99%)      393.00μs
S multiple map calls          1416.18        706.12μs       (±19.51%)      690.00μs
S streamed map calls          1033.65        967.44μs       (±8.95%)       945.00μs

Comparison:
S orderless map               2512.35
S multiple map calls          1416.18         - 1.77x slower
S streamed map calls          1033.65         - 2.43x slower

Benchmarking M multiple map calls...
Benchmarking M orderless map...
Benchmarking M streamed map calls...

Name                          ips            average        deviation      median
M orderless map               188.95         5292.38μs      (±25.50%)      5181.50μs
M multiple map calls          141.80         7052.43μs      (±14.67%)      6891.00μs
M streamed map calls          101.71         9831.76μs      (±7.56%)       9598.00μs

Comparison:
M orderless map               188.95
M multiple map calls          141.80          - 1.33x slower
M streamed map calls          101.71          - 1.86x slower

Benchmarking L multiple map calls...
Benchmarking L orderless map...
Benchmarking L streamed map calls...

Name                          ips            average        deviation      median
L orderless map               14.93          66965.18μs     (±6.04%)       67260.00μs
L multiple map calls          14.22          70315.81μs     (±12.18%)      67580.00μs
L streamed map calls          10.20          98031.10μs     (±2.21%)       97488.00μs

Comparison:
L orderless map               14.93
L multiple map calls          14.22           - 1.05x slower
L streamed map calls          10.20           - 1.46x slower
```
