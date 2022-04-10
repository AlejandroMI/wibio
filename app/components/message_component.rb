# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(resource:)
    @resource = resource
  end

end
