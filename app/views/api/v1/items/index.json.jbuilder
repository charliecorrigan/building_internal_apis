json.(@items) do |item|
  json.(item, :name, :description)
  json.num_orders(item.orders.count)
end