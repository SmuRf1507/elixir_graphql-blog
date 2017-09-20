defmodule Graphql.PostResolver do
  alias Graphql.Repo
  alias Graphql.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def get(%{id: id}, _) do
    case Repo.get(Post, id) do
      nil -> {:error, "Post id ##{id} not found"}
      comment -> {:ok, comment}
    end
  end
end
