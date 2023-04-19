class Post < ApplicationRecord
    belongs_to :user
    #has_many :post_tags, dependent: :destroy
    #has_many :tags, through: :post_tags
    #has_many :tags
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
    
    has_one_attached :image

  def get_image
     unless image.attached?
      file_path=Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename:'default-image.jpg', content_type:'image/jpeg')
     end
      image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
