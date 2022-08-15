class Bio < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy

  validates_presence_of :user
end
