charges = ["送料込み（出品者負担","着払い（購入者負担）"]

charges.each do |charge|
  ShippingCharge.create(shipping_charge: charge)
end