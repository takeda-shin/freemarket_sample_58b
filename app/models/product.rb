class Product < ApplicationRecord

  belongs_to :brand
  belongs_to :user
  has_many :photos


  validates :name, presence: true
  validates :image, presence: true

end
