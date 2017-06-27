require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'
    expect(response).to be_success

    raw_items = JSON.parse(response.body)
    raw_item = raw_items.first
    # binding.pry
    expect(raw_items.count).to eq(3)
    expect(raw_item).to have_key("description")
    expect(raw_item["name"]).to be_a String
    expect(raw_item).to have_key("name")
  end

  context "GET /items/:id" do
    it "can get one item by its id" do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(id)
      expect(item).to have_key("name")
    end
  end

  context "POST /api/v1/items" do
    it "creates an item with valid params" do
      item_params = {
        name: "Super Mario Bros. 3",
        description: "Good soundtrack."
      }
      expect {
        post "/api/v1/items", params: item_params
      }.to change { Item.count }.by(1)

      expect(response).to be_success
    end
  end
end
