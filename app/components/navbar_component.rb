# frozen_string_literal: true

include HeroiconHelper

class NavbarComponent < ViewComponent::Base
  def initialize(user:, navigation:)
    @user = user
    @navigation = navigation
  end

  private

  def primary_navigation
    @navigation.first[:items]
  end
end
