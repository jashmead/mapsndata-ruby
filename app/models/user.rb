class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, length: { mimimum: 1, maximum: 255 }

  # since uniqueness of email being checked by gem 'devise', do not check here (otherwise we get 2x error messages)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, length: { mimimum: 1, maximum: 255 } #, #uniqueness: true

  # destroy will only destroy the top copy, see the history triggers & tables
  has_many :maps, inverse_of: :user, dependent: :destroy

  before_save do
    self.email = email.downcase
  end

end
