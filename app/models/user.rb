class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :boards
  has_many :board_users
  has_many :chats
  has_many :board_messages

  with_options presence: true do
    validates :nickname
    validates :phone_number, format: {with: /\A0[5789]0\d{4}\d{4}\z/}
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_kana
    validates :first_kana
  end


  # validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/i }

end
