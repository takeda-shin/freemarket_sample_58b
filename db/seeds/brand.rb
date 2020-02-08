brands = ["シャネル","グッチ","ルイヴィトン","シュプリーム","アディダス","ナイキ","プーマ"]

brands.each do |brand|
  Brand.create(name: brand)
end