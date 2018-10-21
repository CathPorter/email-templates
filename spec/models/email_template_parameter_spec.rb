require 'rails_helper'

RSpec.describe EmailTemplateParameter, type: :model do
  let(:email_template) { create(:email_template) }

  describe "#name" do
    it "must be unique" do
      param1 = create(:email_template_parameter, email_template: email_template)
      param2 = build(:email_template_parameter, email_template: email_template)
      expect(param2.valid?).to be(false)
    end
    it "is not valid when blank" do
      param = build(:email_template_parameter, email_template: email_template, name: '')
      expect(param.valid?).to be(false)
    end
  end
  describe "#description" do
    it "is not valid when blank" do
      param = build(:email_template_parameter, email_template: email_template, description: '')
      expect(param.valid?).to be(false)
    end
  end
  describe "#example" do
    it "is not valid when blank" do
      param = build(:email_template_parameter, email_template: email_template, example: '')
      expect(param.valid?).to be(false)
    end
  end
  describe "#email_template" do
    it "is not valid when blank" do
      param = build(:email_template_parameter, email_template: nil)
      expect(param.valid?).to be(false)
    end
  end
end
