class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :name, presence: true, uniqueness: true

  # since uniqueness of email being checked by device, do not check here (otherwise we get 2x error messages)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } #, #uniqueness: true

  before_save do
    self.email = email.downcase
  end

end
