class Product < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader
  belongs_to :category

  validates :title_en, presence: true,
            length: { maximum: 250 }

  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0.01 }

end
