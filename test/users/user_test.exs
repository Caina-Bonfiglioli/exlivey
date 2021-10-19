defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build(
        "Rua do limoeiro, 42",
        "Cebolinha",
        "cebolinha@email.com",
        "123456789",
        25
      )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, return an error" do
      response = User.build(
        "Rua do limoeiro",
        "Cebolinha",
        "cebolinha@email.com",
        "123456789",
        15
      )

      expected_response = {:error, "Invalide parameters"}

      assert response == expected_response
    end
  end
end
