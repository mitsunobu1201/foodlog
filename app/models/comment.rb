class Comment < ApplicationRecord
  belongs_to :user

  def self.search_by_tag(tag)
    where("comment LIKE ?", "%##{tag}%")
  end

    #enum関連
    enum timeframe: { morning: 0, lunch: 1, dinner: 2, snack: 3 }


    validates :comment, presence: true, length: { minimum: 1, maximum: 200 }
end
