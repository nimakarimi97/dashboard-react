class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = []
    items.map { |item| @items << OpenStruct.new(item) }
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    @items.map(&:quantity_by_size).map(&:values).sum(&:sum)
  end
end

require 'ostruct'

puts BoutiqueInventory.new(
       [
         {
           price: 65.00,
           name: 'Maxi Brown Dress',
           quantity_by_size: {
             s: 3,
             m: 7,
             l: 8,
             xl: 4,
           },
         },
         { price: 50.00, name: 'Red Short Skirt', quantity_by_size: {} },
         {
           price: 29.99,
           name: 'Black Short Skirt',
           quantity_by_size: {
             s: 1,
             xl: 4,
           },
         },
         {
           price: 20.00,
           name: 'Bamboo Socks Cats',
           quantity_by_size: {
             s: 7,
             m: 2,
           },
         },
       ],
     ).total_stock
