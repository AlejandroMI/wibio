# frozen_string_literal: true

class User < ApplicationRecord
  has_one :bio, dependent: :destroy
  has_many :links, through: :bio
  has_one_attached :avatar

  after_create :assign_bio

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates_presence_of :nickname, :full_name
  validates_length_of :full_name, maximum: 70
  validates_length_of :about, maximum: 140
  validates_length_of :nickname, minimum: 2, maximum: 34
  validates_uniqueness_of :nickname, case_sensitive: false
  validates_format_of :nickname, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  validates :avatar, size: { less_than_or_equal_to: 5.megabytes, message: "file too large. Max size is 5 MB." }, content_type: ["image/jpeg", "image/gif", "image/png"]

  attr_writer :login

  # Allow users to sign in using either email or nickname
  def login
    @login || self.nickname || self.email
  end

  # Overwrite Devise's method to change login action behaviour
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # Create Bio associated to user only if does not have one
  def assign_bio
    Bio.create(user: self) if self.bio.nil?
  end

  # Matches id to avatar default image
  # @return [Integer] that corresponds to an image in the avatars folder
  def default_avatar_number
    (1..15).to_a.rotate(id).last
  end
end
