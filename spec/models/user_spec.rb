require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#name" do
    it "must be unique" do
      user1 = create(:user)
      user2 = build(:user, email: 'different@email.com')
      expect(user2.valid?).to be(false)
    end
    it "is not valid when blank" do
      user = build(:user, name: '')
      expect(user.valid?).to be(false)
    end
  end

  describe "#email" do
    it "must be unique" do
      user1 = create(:user)
      user2 = build(:user, name: 'different name')
      expect(user2.valid?).to be(false)
    end
    it "is not valid when blank" do
      user = build(:user, email: '')
      expect(user.valid?).to be(false)
    end
  end

end
