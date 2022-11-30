defmodule ADogcion.AdopcionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ADogcion.Adopcion` context.
  """

  @doc """
  Generate a animal.
  """
  def animal_fixture(attrs \\ %{}) do
    {:ok, animal} =
      attrs
      |> Enum.into(%{
        age: 42,
        breed: "some breed",
        description: "some description",
        health_information: "some health_information",
        name: "some name",
        size: "some size",
        special_needs: "some special_needs",
        species: "some species"
      })
      |> ADogcion.Adopcion.create_animal()

    animal
  end
end
