class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
    #has_many :hashtag_post_relations
    #has_many :hashtags, through: :hashtag_post_relations
    has_one_attached :image
    
    #after_create do
        #post = Post.find_by(id: self.id)
        #hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        #hashtags.uniq.map do |hashtag|
         #ハッシュタグは先頭の'#'を外した上で保存
      #tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      #post.hashtags << tag
     #end
    #end
    
    #before_update do 
    #post = Post.find_by(id: self.id)
    #post.hashtags.clear
    #hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #hashtags.uniq.map do |hashtag|
      #tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      #post.hashtags << tag
    #end
  #end

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
