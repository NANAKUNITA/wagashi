class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  #has_many :comments, dependent: :destroy
  validates :user_id, uniqueness: { scope: :post_id }
  #一つのユーザーは同じ投稿に対して一回しかブックマークができませんというバリデーション
end
