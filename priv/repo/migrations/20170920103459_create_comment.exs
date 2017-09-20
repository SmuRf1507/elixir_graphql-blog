defmodule Graphql.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :title, :string

      timestamps()
    end

  end
end
