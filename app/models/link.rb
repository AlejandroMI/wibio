# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :bio
  acts_as_list scope: :bio
  validates :name,
            presence: true,
            length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :url,
            presence: true,
            url: { message: "is not valid. It must start with http:// or, preferably, https://" }

  def domain
    URI.parse(url).host
  end
end
