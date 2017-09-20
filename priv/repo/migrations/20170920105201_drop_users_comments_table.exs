defmodule Graphql.Repo.Migrations.DropUsersCommentsTable do
  use Ecto.Migration

  def change do
    drop table(:users_comments)
  end
end
