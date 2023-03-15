class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :comments
end
