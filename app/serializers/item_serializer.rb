class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_orders

  has_many :orders

  def num_orders
    object.orders.count
  end
end
