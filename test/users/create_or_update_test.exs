defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valir, saves the user" do
      params = %{name: "nome", address: "endereço", email: "email", cpf: "cpf", age: 23}

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User saved successfully"}

      assert response == expected_response
    end

    test "when thre are invalid params, return an error" do
      params = %{name: "nome", address: "endereço", email: "email", cpf: "cpf", age: 10}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalide parameters"}

      assert response == expected_response
    end
  end
end
