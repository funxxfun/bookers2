class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
 #ここからフォロー機能のための記述
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  
  
  
  validates :name, presence: true, uniqueness: true, length: { in: 2..20}
  validates :introduction,  length: { maximum: 50}

  attachment :profile_image


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end
  
  
  def self.search(content, method)
  # 選択した検索方法が完全一致だったら
    if method == 'perfect'
      where(name: content)
    # 選択した検索方法が前方一致だったら
    elsif method == 'front'
      where('name LIKE ?', content+'%')
    # 選択した検索方法が後方一致だったら
    elsif method == 'back'
      where('name LIKE ?', '%'+content)
    # 選択した検索方法が部分一致だったら
    else
      where('name LIKE ?', '%'+content+'%')
    end
  end
 


end
