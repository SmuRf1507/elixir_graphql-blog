defmodule Graphql.Repo.Migrations.AddUsersCommentsTable do
  use Ecto.Migration

  def change do
    create table(:users_comments) do
      add :user_id, references(:users)
      add :comment_id, references(:comments)
    end
    create unique_index(:users_comments, [:user_id, :comment_id])
  end
end
