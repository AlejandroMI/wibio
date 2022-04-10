# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessageComponent, type: :component do
  it 'should render the errors for a resource' do
    user = build(:user, nickname: nil)
    user.validate
    result = render_inline(MessageComponent.new(resource: user))
    assert_includes result.to_html, "Nickname can't be blank"
  end
end
