defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, return an item" do
      response = Item.build(
        "pizza de peperoni",
        :pizza,
        "35.5",
        1
      )

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, return an error" do
      response = Item.build(
        "pizza de peperoni",
        :banana,
        "35.5",
        1
      )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, return an error" do
      response = Item.build(
        "pizza de peperoni",
        :pizza,
        "banana_price",
        1
      )

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, return an error" do
      response = Item.build(
        "pizza de peperoni",
        :pizza,
        "35.5",
        0
      )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end

end
