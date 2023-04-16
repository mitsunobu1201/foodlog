class Food < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy

validates :name, presence: true, length: { minimum: 1, maximum: 50 }
validates :calorie, presence: true
validates :protein, presence: true
validates :fat, presence: true
validates :carbohydrate, presence: true
validates :explanation, presence: true, length: { minimum: 1, maximum: 100 }


end
