class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :nices, dependent: :destroy
  has_many :comments, dependent: :destroy

  #enum関連
  enum purpose: { training: 0, diet: 1, health: 2, etc: 3 }
  enum sex: { men: 0, women: 1 }
  enum activity: { sedentary: 0, light: 1, moderate: 2, intense: 3, very_intense: 4 }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #年齢計算メゾット
  def age
    now = Time.zone.now
    age = now.year - birthday.year

    # 誕生日を過ぎていない場合は、1歳減らす
    age -= 1 if now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day)

    age
  end

#新規登録の追加バリデーション
  validates :name,  presence: true,  length: { minimum: 1, maximum: 20 }
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 300, allow_float: true }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 300, allow_float: true }
  validates :purpose, presence: true, length: { minimum: 1, maximum: 100 }
  validates :profile, length: { minimum: 0, maximum: 150 }
  validates :sex, presence: true
  validates :activity, presence: true
  validates :birthday, presence: true
  validates :status, inclusion: { in: [true, false] }

end