# frozen_string_literal: true

include HeroiconHelper

class Forms::FileAvatarComponent < ViewComponent::Base
  def initialize(user:, form:)
    @user = user
    @form = form
  end
end
