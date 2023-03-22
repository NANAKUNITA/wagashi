class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
