class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  #ここからフォロー機能のための記述
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower, through: :active_relationships, source: :followed
  has_many :followed, through: :passive_relationships, source: :follower

  validates :name, presence: true, uniqueness: true, length: { in: 2..20}
  validates :introduction,  length: { maximum: 50}

  attachment :profile_image


    # ここからコメント機能のための記述

  # def follow(user_id)
  #   active_relationships.create(follower_id: user_id)
  # end
  # def unfollow(user_id)
  #   active_relationships.find_by(follower_id: user_id).destroy
  # end
  # def following?(user)
  #   followings.include?(user)
  # end
  
  
  




end
