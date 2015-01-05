defmodule Issues.Formatter do
  @width_total 85
  @width_number 4
  @width_created_at 20
  @width_title @width_total - (@width_created_at + @width_number + 7)

  def print_table([]), do: :ok
  def print_table(list) do 
    IO.puts "\n" <> String.duplicate("-", @width_total)
    print_table(list, 1)
    IO.puts String.duplicate("-", @width_total) <> "\n"
  end
  
  def print_table([], _n), do: :ok
  def print_table([row | rest], n) do
    print_row(row, n)
    print_table(rest, n+1)
  end

  def print_row(row, _number) do
    number  = row["number"]     |> column(@width_number)
    created = row["created_at"] |> column(@width_created_at)
    title   = row["title"]      |> column(@width_title) |> suffix_dots
    IO.puts " #{number} | #{created} | #{title}"
  end

  def column(string, width) when not is_binary(string) do
    column(to_string(string), width)
  end

  def column(string, width) do
    string
      |> String.slice(0..width)
      |> String.ljust(width, ?\s)
  end

  def suffix_dots(string) do
    case not String.ends_with?(string, "   ") do
      true -> String.slice(string, 0, @width_title-3) <> "..."
      false -> string
    end
  end
end