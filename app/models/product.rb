class Product < ApplicationRecord

  validates :name,
            :image,
            :text, 
            :category_id,
            :condition, 
            :product_size ,
            :shipping_charge,
            :shipping_method, 
            :delivery_area, 
            :price,
            presence: true
  belongs_to :category
  belongs_to :brand

  belongs_to :user
  has_many :photos


  validates :name, presence: true
  validates :image, presence: true

end
