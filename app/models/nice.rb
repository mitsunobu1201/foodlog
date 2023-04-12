class Nice < ApplicationRecord
  belongs_to :user

    #enum関連
    enum timeframe: { morning: 0, lunch: 1, dinner: 2, snack: 3 }
end
