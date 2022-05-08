# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  def initialize(type:, message:)
    @type = type
    @message = message
  end

end
