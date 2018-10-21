require 'rails_helper'

RSpec.describe Appointment, type: :model do

  describe "#time" do
    it "must be unique" do 
      user = create(:user)
      appt1 = create(:appointment, user: user)
      appt2 = build(:appointment, user: user, notes: 'some notes here')
      expect(appt2.valid?).to be(false)
    end
    it "is not valid when blank" do
      user = create(:user)
      appt = build(:appointment, user: user, time: '')
      expect(appt.valid?).to be(false)
    end
  end

end
