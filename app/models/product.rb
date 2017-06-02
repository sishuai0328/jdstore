class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  has_many :my_favorites
  has_many :collectors, through: :my_favorites, source: :user
  has_many :photos
  accepts_nested_attributes_for :photos
  def self.search(search)
    where("title LIKE ? ", "%#{search}%")
    #where("description LIKE ?", "%#{search}%")
  end

end
