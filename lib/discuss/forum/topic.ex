defmodule Discuss.Forum.Topic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Forum.Topic

  import Ecto.Query, warn: false
  alias Discuss.Repo

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "topics" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Topic{} = topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def list_all do
    Repo.all(Topic)
  end
  
  def get!(id), do: Repo.get!(Topic, id)

  def create(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Topic{} = topic) do
    Repo.delete(topic)
  end

  def change(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end

end
