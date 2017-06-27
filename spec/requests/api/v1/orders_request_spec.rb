require 'rails_helper'

describe "Orders API" do
  it "sends a list of orders" do
    create_list(:order, 3)

    get '/api/v1/orders'
    expect(response).to be_success

    raw_orders = JSON.parse(response.body)
    raw_order = raw_orders.first
    # binding.pry
    expect(raw_orders.count).to eq(3)
    expect(raw_order).to have_key("price")
    expect(raw_order["name"]).to be_a String
    expect(raw_order).to have_key("name")
  end

  context "GET /orders/:id" do
    it "can get one order by its id" do
      id = create(:order).id

      get "/api/v1/orders/#{id}"

      order = JSON.parse(response.body)

      expect(response).to be_success
      expect(order["id"]).to eq(id)
      expect(order).to have_key("name")
      expect(order).to have_key("price")
    end
  end
end