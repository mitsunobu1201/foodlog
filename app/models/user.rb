class User < ApplicationRecord
  
  #enum関連
  enum purpose: { training: 0, diet: 1, health: 2, etc: 3 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
