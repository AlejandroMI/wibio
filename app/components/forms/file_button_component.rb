# frozen_string_literal: true

class Forms::FileButtonComponent < ViewComponent::Base
  def initialize(form:, attribute:)
    @form = form
    @attribute = attribute
  end
end
