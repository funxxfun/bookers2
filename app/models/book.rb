class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
  def self.search(content, method)
  # 選択した検索方法が完全一致だったら
    if method == 'perfect'
      where(title: content)
    # 選択した検索方法が前方一致だったら
    elsif method == 'front'
      where('title LIKE ?', content+'%')
    # 選択した検索方法が後方一致だったら
    elsif method == 'back'
      where('title LIKE ?', '%'+content)
    # 選択した検索方法が部分一致だったら
    else
      where('title LIKE ?', '%'+content+'%')
    end
  end
  
  
 
  
end
