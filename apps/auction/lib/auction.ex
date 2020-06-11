defmodule Auction do
  @moduledoc """
  Documentation for `Auction`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Auction.hello()
      :world

  """
  alias Auction.{Item}   

  @repo Auction.Repo

  def insert(attrs) do
    Item
    |> struct(attrs)
    |> @repo.insert()
  end

  def list_items do     
    @repo.all(Item)   
  end   

  def get_item(id) do     
    @repo.get!(Item, id)   
  end   
  
  def get_item_by(attrs) do     
    @repo.get_by(Item, attrs)   
  end

  def delete_item(%Auction.Item{} = item), do: @repo.delete(item)

  def update_item(%Auction.Item{} = item, updates) do
    item
    |> Item.changeset(updates)
    |> @repo.update()
  end 

  def new_item, do: Item.changeset(%Item{})

  def insert_item(attrs) do
    %Item{}
    |> Item.changeset(attrs)
    |> @repo.insert()
  end

  def edit_item(id) do
    get_item(id)
    |> Item.changeset()
  end
end
