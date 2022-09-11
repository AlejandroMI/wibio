# frozen_string_literal: true

class Bio < ApplicationRecord
  belongs_to :user
  has_many :links, -> { order(position: :asc) }, dependent: :destroy

  validates_presence_of :user
end
