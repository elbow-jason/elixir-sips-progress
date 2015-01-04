defmodule Issues.CLI do
  @default_count 4
  @moduledoc """
  CLI parsing and dispatch to functions that will generate the
  issues table for the last _n_ issues of a github project
  """

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [ count | #{@default_count} ]
    """
    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response
    |> convert_to_list_of_hashdicts
    
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    { _, message } = List.keyfind(error, "message", 0)
    IO.puts "Error fetching from Github: #{message}"
    System.halt(2)
  end

  def convert_to_list_of_hashdicts(list) do
    list |> Enum.map(&Enum.into(&1, HashDict.new))
  end

  @doc """
  `argv` of -h or --help gives :help
  else it gives username, project, and number of entries(optional)

  Returns a tuple of `{ username, project, count }`, or `:help`
  if --help or -h were the options.
  """
  def parse_args(argv) do
    parse = OptionParser.parse( argv,
      switches: [ help: :boolean ],
      aliases:  [ h: :help ]
    )

    case parse do

      #{[help: true], _ , _ } ->
      # :help

      { _, [ user, project, count ], _} ->
        {user, project, String.to_integer(count)}

      { _, [ user, project ], _} ->
        {user, project, @default_count}

      _ ->
        :help


    end
  end
end
