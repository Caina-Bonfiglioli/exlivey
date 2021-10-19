defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Cebolinha",
      email: "cebolinha@email.com",
      cpf: "123456789",
      age: 25,
      address: "Rua do limoeiro, 42"
    }
  end

  def item_factory do
    %Item{category: :pizza, description: "pizza de peperoni", quantity: 1, unity_price: Decimal.new("35.5")}
  end

  def order_factory do
    %Order{
      delivery_address: "Rua do limoeiro, 42",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de salmão",
          category: :japonesa,
          quantity: 2,
          unity_price:
          Decimal.new("15.5")
        )
      ],
      total_price: Decimal.new("66.50"),
      user_cpf: "123456789"
    }
  end
end
