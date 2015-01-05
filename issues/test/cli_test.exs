defmodule TestIssuesCLI do
   use ExUnit.Case
   import Issues.CLI, only: [ parse_args: 1,
                              sort_into_ascending_order: 1,
                              convert_to_list_of_hashdicts: 1
                            ]

  test "parse_args return :help with -h or --help options in command-line" do
    assert parse_args(["-h", "something"]) == :help
    assert parse_args(["--help", "something"]) == :help
  end

  test "three values returned when three given" do
    result = parse_args(["elbow-jason", "issues", "99"])
    expected = {"elbow-jason", "issues", 99}
    assert result == expected
  end

  test "count is defaulted if two values given" do
    result = parse_args(["elbow-jason", "issues"])
    expected = {"elbow-jason", "issues", 4}
    assert result == expected
  end

  test "sort ascending orders the correct way" do
    result = fake_created_at_list(~w(a b c))
      |> sort_into_ascending_order

    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w(a b c)
  end

  defp fake_created_at_list(values) do
    created_at = fn value -> [{"created_at", value}, {"other_data", "no"}] end
    values
      |> Enum.map(created_at)
      |> convert_to_list_of_hashdicts
  end

end