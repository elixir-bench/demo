# ElixirBench Demo Benchmarks

This project contains the required configurations to have a project's benchmarks
running on https://www.elixirbench.org.


## Benchmark Library

ElixirBench currently support benchmarks written with [`Benchee`](https://github.com/PragTob/benchee),
and you'll have to have it as a dependency of your project in your `mix.exs` file.

```elixir
# Benchmarks
{:benchee, "~> 0.11.0", only: :bench},
{:benchee_json, "~> 0.4.0", only: :bench}
```

## Setting Up your project

ElixirBench is concerned to `bench/` folder under the root of your project. From
that it will check for the required config files and scripts to then be able to
download the code and run the benchmarks jobs properly.

`config.yml`: Describe most of the configuration related to elixir and erlang
versions, external dependencies like databases and environment variables you
might need to setup for the run.

`bench_helper.exs`: Call the benchmarks scripts. Here you can do any 
setup and load required files before actually calling the Benchmark functions.

## Benchmark samples

Our benchmarks are placed under `benchee/benchmarks/` folder. There you can find
some examples on how to setup a benchmark. Pay attention to the following configurations:

- `formatters`: ElixirBench expect results to be given in json files from Benchee,
so you need to use the `JSON formatter` with the `JSON plugin`.
- `formatter_options`: You need to specify the output path for the benchmark results
following the path given by `BENCMARKS_OUTPUT_PATH` environment variable.

## License

This project is released under the Apache 2.0 License - see the [LICENSE](LICENSE.md) file.

