defmodule TestIssuesCLI do
   use ExUnit.Case
   import Issues.CLI, only: [ parse_args: 1 ]

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

 end