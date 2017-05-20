class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :my_favorites
  has_many :collectors, through: :my_favorites, source: :user

  def self.search(search)
    where("title LIKE ? ", "%#{search}%")
    #where("description LIKE ?", "%#{search}%")
  end

end
