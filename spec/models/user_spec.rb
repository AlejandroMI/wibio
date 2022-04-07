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
end
