class Hashtag < ApplicationRecord
  #validates :hashname, presence: true, length: { maximum:99}
  #has_many :hashtag_post_relations
  #has_many :posts, through: :hashtag_post_relations
end
