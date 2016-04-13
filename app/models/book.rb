class Book < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader


  validates :title, presence: true, length: { minimum: 3}
  validates :genre, presence: true, length: { minimum: 5}


end