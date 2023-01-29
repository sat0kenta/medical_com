class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :clinicals, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :clinical_comments, dependent: :destroy
  
  
  #DM機能
  has_many :messages, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :favorited_clinicals, through: :favorites, source: :clinical
  
  has_one_attached :profile_image
  

  # フォローされる
  has_many :reverse_of_relationshiops, class_name:"Relationship", foreign_key: "follow_id", dependent: :destroy
  # フォローする
  has_many :relationships, class_name:"Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローしているかを通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationshiops, source: :follower
  # フォローされているかを通じて参照→自分がフォローしている人
  has_many :follows, through: :relationships, source: :follow
  
  
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

 def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
 end
 
 def follow(user_id)
    relationships.create(follow_id:user_id)
 end
 def unfollow(user_id)
  p "hoge"
    relationships.find_by(follow_id:user_id).delete
 end
 
 def following?(user)
    follows.include?(user)
 end
 
  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
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
  
def active_for_authentication?
  super && self.is_active
end

end
