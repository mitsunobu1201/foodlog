class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :food_id, presence: true
  validates :ymd, presence: true
  validates :timeframe,presence:  true
  validates :quantity, presence: true
end
