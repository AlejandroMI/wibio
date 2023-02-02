# frozen_string_literal: true

require "rails_helper"

RSpec.describe BlacklistedNickname, type: :model do
  it "should be valid with the factory" do
    b = build(:blacklisted_nickname)
    expect(b).to be_valid
  end
end
