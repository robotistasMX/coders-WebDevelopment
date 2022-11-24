defmodule ADogcion.Documents do

  import Ecto.Query, warn: false
  alias ADogcion.Repo
  alias ADogcion.Documents.Upload

  def list_uploads do
    Repo.all(Upload)
  end

  def get_upload!(id) do
    Upload
    |> Repo.get!(id)
  end

  def get_upload_by(params) do
    Enum.find(list_uploads(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end


  def create_upload_from_plug_upload(%Plug.Upload{
    filename: filename,
    path: tmp_path,
    content_type: content_type
  }) do

    hash =
      File.stream!(tmp_path, [], 2048)
      |> Upload.sha256()

    with {:ok, %File.Stat{size: size}} <- File.stat(tmp_path),
         {:ok, upload} <-
           %Upload{}
           |> Upload.changeset(%{
             filename: String.replace(filename, ~r"[:!@#$%^&:|,/ ]", ""),
             content_type: content_type,
             hash: hash,
             size: size
           })
           |> Repo.insert(),

         :ok <- File.cp(
           tmp_path,
           Upload.local_path(
             upload.id,
             String.replace(filename, ~r"[:!@#$%^&:|,/ ]", "")
           )
         )

      do
      {:ok, upload}

    else
      {:error, reason}=error -> error

    end
  end


  def delete_upload(%Upload{} = upload) do
    Repo.delete(upload)
  end

  end
