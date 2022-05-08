# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashComponent, type: :component do
  it 'should render the message' do
    result = render_inline(FlashComponent.new(type: :alert, message: "This is an alert."))
    assert_includes result.to_html, "This is an alert."
  end
end
