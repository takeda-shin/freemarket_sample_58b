methods = ["1〜2日で発送","2〜3日で発送","4〜7日で発送"]

methods.each do |method|
  ShippingMethod.create(shipping_method: method)
end