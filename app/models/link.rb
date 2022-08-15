class Link < ApplicationRecord
  belongs_to :bio
  acts_as_list scope: :bio
  validates :name,
            presence: true,
            length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :url,
            presence: true,
            format: { with: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_+.~#?&\/\/=]*)/,
                      message: "is not valid. It must start with http:// or, preferably, https://" }

  def domain
    URI.parse(url).host
  end
end
