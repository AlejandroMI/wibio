# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  # @param menu_items [Array] using same convention as simple-navigation. See config/navigation.rb and what renders
  def initialize(menu_items:)
    @menu_items = menu_items # TODO: Make sure if an item from the array has no icon no icons are rendered
  end
end
