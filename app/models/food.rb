class Food < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy

validates :name, presence: true, length: { minimum: 1, maximum: 50 }
validates :calorie, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:9999 }
validates :protein, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:9999, allow_float: true }
validates :fat, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:9999, allow_float: true }
validates :carbohydrate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:9999, allow_float: true }
validates :explanation, presence: true, length: { minimum: 1, maximum: 150 }


end
