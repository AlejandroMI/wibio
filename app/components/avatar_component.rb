# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  # Used to represent users
  # @param user [User]
  # @param size [Integer] is used to set height and width of the avatar (10 = 2.5rem = 40px) - https://tailwindcss.com/docs/height
  def initialize(user:, size:)
    @user = user
    @size = size
  end

  private

  def size_classes
    "h-#{@size} w-#{@size}"
  end

  def resize_value
    @resize_value ||= @size * 10
  end

end
