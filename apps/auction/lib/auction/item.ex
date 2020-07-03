defmodule Auction.Item do   
    # defstruct [:id, :title, :description, :ends_at]     
    use Ecto.Schema
    import Ecto.Changeset

    schema "items" do
        field :title, :string
        field :description, :string
        field :ends_at, :utc_datetime
        has_many :bids, Auction.Bid
        timestamps()
    end

    def changeset(item, params \\ %{}) do
        item
        |> cast(params, [:title, :description, :ends_at])
        |> validate_required(:title)
        |> validate_length(:title, min: 3)
        |> validate_length(:description, max: 200)
        |> validate_change(:ends_at, &validate_datetime/2)
    end

    def validate_datetime(:ends_at, ends_at_date) do
        case DateTime.compare(ends_at_date, DateTime.utc_now()) do
            :lt -> [ends_at: "can't be in the past"] 
            _ -> []
        end
    end
end