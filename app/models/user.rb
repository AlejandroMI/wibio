class User < ApplicationRecord
  has_one :bio
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :nickname
  validates_uniqueness_of :nickname, case_sensitive: false
  validates_format_of :nickname, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  attr_writer :login

  # Allow users to sign in using either email or nickname
  def login
    @login || self.nickname || self.email
  end

  # Overwrite Devise's method to change login action behaviour
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
