defmodule LiveLibrary.Search.Criteria do
  defstruct [:title, :categories, :author_last_name, :available]
  @types %{title: :string, categories: :list, author_last_name: :string, available: :boolean}

  import Ecto.Changeset

  def changeset(%__MODULE__{} = criteria, attrs) do
    {criteria, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required_inclusion([:title, :categories, :author_last_name, :available])
  end

  def validate_required_inclusion(changeset, fields,  _options \\ []) do
    if Enum.any?(fields, fn(field) -> get_field(changeset, field) end),
      do: changeset,
      else: add_error(changeset, hd(fields), "One of these fields must be present: #{inspect fields}")
  end
end
