defmodule ADogcionWeb.AnimalController do
  use ADogcionWeb, :controller

  alias ADogcion.Adopcion
  alias ADogcion.Accounts
  alias ADogcion.Adopcion.Animal

  def index(conn, _params) do
    animals = Adopcion.list_animals()
    render(conn, "index.html", animals: animals)
  end

  def new(conn, _params) do
    changeset = Adopcion.change_animal(%Animal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"animal" => animal_params}) do
    user = Accounts.get_user(conn.assigns.current_user.id)
    case Adopcion.create_animal(user,animal_params) do
      {:ok, animal} ->
        conn
        |> put_flash(:info, "Animal created successfully.")
        |> redirect(to: Routes.animal_path(conn, :show, animal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    animal = Adopcion.get_animal!(id)
    render(conn, "show.html", animal: animal)
  end

  def edit(conn, %{"id" => id}) do
    animal = Adopcion.get_animal!(id)
    changeset = Adopcion.change_animal(animal)
    render(conn, "edit.html", animal: animal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Adopcion.get_animal!(id)

    case Adopcion.update_animal(animal, animal_params) do
      {:ok, animal} ->
        conn
        |> put_flash(:info, "Animal updated successfully.")
        |> redirect(to: Routes.animal_path(conn, :show, animal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", animal: animal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Adopcion.get_animal!(id)
    {:ok, _animal} = Adopcion.delete_animal(animal)

    conn
    |> put_flash(:info, "Animal deleted successfully.")
    |> redirect(to: Routes.animal_path(conn, :index))
  end
end
