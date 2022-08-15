require "rails_helper"

RSpec.describe Bio, type: :model do
  describe 'Bio creation' do
    it 'should not be created without a user' do
      expect(build(:bio, user: nil)).not_to be_valid
    end
    it 'should be created with a user' do
      expect(build(:bio)).to be_valid
    end
  end
end
