class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |item| item[:name] }.sort
  end

  def cheap
    @items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    @items.select { |item| item[:quantity_by_size] == {} }
  end

  def stock_for_item(name)
    for item in @items
      item[:quantity_by_size] if item[:name] == name
    end

    # * from community
    # items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  def total_stock
    @items.map { |item| item[:quantity_by_size].map { |i, it| it }.sum }.sum

    # * from community
    # items.map { |i| i[:quantity_by_size].values.sum }.sum
  end

  private

  attr_reader :items
end

puts BoutiqueInventory
       .new(
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
       )
       .stock_for_item('Black Short Skirt')

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

#=> 36
