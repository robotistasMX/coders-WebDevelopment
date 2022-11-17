defmodule ADogcion.AdopcionTest do
  use ADogcion.DataCase

  alias ADogcion.Adopcion

  describe "animals" do
    alias ADogcion.Adopcion.Animal

    import ADogcion.AdopcionFixtures

    @invalid_attrs %{age: nil, breed: nil, description: nil, health_information: nil, name: nil, size: nil, special_needs: nil, species: nil}

    test "list_animals/0 returns all animals" do
      animal = animal_fixture()
      assert Adopcion.list_animals() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Adopcion.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      valid_attrs = %{age: 42, breed: "some breed", description: "some description", health_information: "some health_information", name: "some name", size: "some size", special_needs: "some special_needs", species: "some species"}

      assert {:ok, %Animal{} = animal} = Adopcion.create_animal(valid_attrs)
      assert animal.age == 42
      assert animal.breed == "some breed"
      assert animal.description == "some description"
      assert animal.health_information == "some health_information"
      assert animal.name == "some name"
      assert animal.size == "some size"
      assert animal.special_needs == "some special_needs"
      assert animal.species == "some species"
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Adopcion.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      update_attrs = %{age: 43, breed: "some updated breed", description: "some updated description", health_information: "some updated health_information", name: "some updated name", size: "some updated size", special_needs: "some updated special_needs", species: "some updated species"}

      assert {:ok, %Animal{} = animal} = Adopcion.update_animal(animal, update_attrs)
      assert animal.age == 43
      assert animal.breed == "some updated breed"
      assert animal.description == "some updated description"
      assert animal.health_information == "some updated health_information"
      assert animal.name == "some updated name"
      assert animal.size == "some updated size"
      assert animal.special_needs == "some updated special_needs"
      assert animal.species == "some updated species"
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Adopcion.update_animal(animal, @invalid_attrs)
      assert animal == Adopcion.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Adopcion.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Adopcion.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Adopcion.change_animal(animal)
    end
  end
end
