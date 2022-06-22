# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  def initialize(menu_items:)
    @menu_items = menu_items
  end

end
