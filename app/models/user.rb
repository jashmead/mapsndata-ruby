=begin
  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    # devise passwords:
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    # avatar? minotar?  betatar? pandora? betosaur gammatops
  end
=end

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, length: { mimimum: 1, maximum: 255 }

  # since uniqueness of email being checked by gem 'devise', do not check here (otherwise we get 2x error messages)
  # note forms now validate email as well, if the input type is email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, length: { mimimum: 1, maximum: 255 } #, #uniqueness: true

  # destroy will only destroy the top copy, see the history triggers & tables
  has_many :maps, inverse_of: :user, dependent: :destroy

  before_save do
    self.email = email.downcase
  end

end
