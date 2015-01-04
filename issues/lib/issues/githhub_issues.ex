defmodule Issues.GithubIssues do
  
  @user_agent [{ "User-agent", "Elixir jlgoldb2@asu.edu" }]
  
  def fetch(user, project) do 
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    # e.g. "https://api.github.com/repos/elixir-lang/elixir/issues"
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, :jsx.decode(body)}
  end 

  def handle_response({:ok, %HTTPoison.Response{status_code: _, body: body}}) do
    {:error, :jsx.decode(body)}
  end

  def handle_response({:error, err}) do
    {:error, err}
  end

end