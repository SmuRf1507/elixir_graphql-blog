defmodule Graphql.CommentResolver do
  alias Graphql.Repo
  alias Graphql.Comment
  alias Graphql.User
  alias Graphql.Post


  def all(_args, _info) do
    {:ok, Repo.all(Comment)}
  end

  def get(%{id: id}, _) do
    case Repo.get(Comment, id) do
      nil -> {:error, "Comment id ##{id} not found"}
      comment -> {:ok, comment}
    end
  end
end
