defmodule Issues.GithubIssues do

  require Logger

  @user_agent [{ "User-agent", "Elixir jlgoldb2@asu.edu" }]

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  #use a module to fetch the value at compile time
  @github_url Application.get_env(:issues, :github_url)
  def issues_url(user, project) do
    # e.g. "https://api.github.com/repos/elixir-lang/elixir/issues"
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    Logger.info "Successful response"
    {:ok, :jsx.decode(body)}
  end 

  def handle_response({:ok, %HTTPoison.Response{status_code: status, body: body}}) do
    Logger.info "Unexpected server response #{status} returned"
    {:error, :jsx.decode(body)}
  end

  def handle_response({:error, err}) do
    Logger.info "An application error #{err} occured"
    {:error, err}
  end

end