class Clinical < ApplicationRecord
  belongs_to :user
  has_many :clinical_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :week_favorites, -> { where(created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)) }, class_name: 'Favorite'
  
  
  has_one_attached :profile_image
    
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:500}
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @clinical = Clinical.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @clinical = Clinical.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @clinicalr = Clinical.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @clinical = Clinical.where("title LIKE?","%#{word}%")
    else
      @clinical = Clinical.all
    end
  end
  
  
 def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
 end

end
