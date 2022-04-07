require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should get a new user' do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'should be valid with the factory' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'shouldnt allow a duplicate alias' do
    user = create(:user, nickname: 'ted', email: 'ted1@test.com')
    expect(user).to be_valid
    user = build(:user, email: 'tes2@test.com', nickname: 'ted')
    expect(user).to_not be_valid
  end
end
