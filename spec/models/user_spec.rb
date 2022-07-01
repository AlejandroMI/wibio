# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "should get a new user" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "should be valid with the factory" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "shouldnt allow a duplicate nickname, even using caps" do
    user = create(:user, nickname: "ted", email: "ted1@test.com")
    expect(user).to be_valid
    user = build(:user, nickname: "ted", email: "tes2@test.com")
    expect(user).to_not be_valid
    user = build(:user, nickname: "Ted", email: "tes2@test.com")
    expect(user).to_not be_valid
  end

  it "should always require a nickname" do
    user = build(:user, nickname: nil)
    expect(user).to_not be_valid
  end

  it "should always require a full name" do
    user = build(:user, full_name: nil)
    expect(user).to_not be_valid
  end

  it "should not allow names with more than 70 chars" do
    user = build(:user, full_name: "a" * 80)
    expect(user).to_not be_valid
  end

  it "should not allow abouts with more than 70 chars" do
    user = build(:user, about: "a" * 145)
    expect(user).to_not be_valid
  end

  it "shouldnt allow a nickname that looks like an email or contains other special chars" do
    user = build(:user, nickname: "ender@captain", email: "ender@test.com")
    expect(user).to_not be_valid
    user = build(:user, nickname: "enderc!123", email: "ender@test.com")
    expect(user).to_not be_valid
  end

  it "should allow nicknames with numbers, underscores or dots" do
    user = build(:user, nickname: "ender_captain", email: "ender@test.com")
    expect(user).to be_valid
    user = build(:user, nickname: "e.c.123", email: "ender@test.com")
    expect(user).to be_valid
  end

  it "should return an integer when asking for default" do
    user = create(:user)
    expect(user.default_avatar_number).to be_between(1, 15)
  end
end
