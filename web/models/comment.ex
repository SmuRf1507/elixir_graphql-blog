defmodule Graphql.Comment do
  use Graphql.Web, :model

  schema "comments" do
    field :body, :string
    field :title, :string

    belongs_to(:post, Graphql.Post)
    belongs_to(:user, Graphql.User)
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :title])
    |> validate_required([:body, :title])
  end
end
