list = Enum.to_list(1..10_000)
map_fun = fn(i) -> [i, i * i] end

jobs = %{
  ":lists.flatmap" => fn -> :lists.flatmap(map_fun, list) end,
  "flat_map"        => fn -> Enum.flat_map(list, map_fun) end,
  "map |> flatten"  => fn -> list |> Enum.map(map_fun) |> List.flatten end
}

path = System.get_env("BENCHMARKS_OUTPUT_PATH") || raise "I DON'T KNOW WHERE TO WRITE!!!"
file = Path.join(path, "flat_map.json")

Benchee.run(
  jobs,
  time: 8,
  formatters: [Benchee.Formatters.JSON],
  formatter_options: [json: [file: file]]
)
