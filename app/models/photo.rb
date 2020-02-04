class Photo < ApplicationRecord

  belongs_to :product ,optional: true, dependent: :destroy

end
