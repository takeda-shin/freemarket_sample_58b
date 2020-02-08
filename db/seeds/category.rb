categories = ["レディース","メンズ","ベビー・キッズ","インテリア・住まい・小物","本・音楽・ゲーム","コスメ・香水・美容","家電・スマホ・カメラ","スポーツ・レジャー","ハンドメイド","チケット","自動車・オートバイ","その他"]
categories.each do |category|
  Category.create(name: category)
end