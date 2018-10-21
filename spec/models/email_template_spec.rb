require 'rails_helper'

RSpec.describe EmailTemplate, type: :model do
  describe "#name" do
    it "must be unique" do
      template1 = create(:email_template)
      template2 = build(:email_template)
      expect(template2.valid?).to be(false)
    end
    it "is not valid when blank" do
      template = build(:email_template, name: '')
      expect(template.valid?).to be(false)
    end
  end
  describe "#subject" do
    it "is not valid when blank" do
      template = build(:email_template, subject: '')
      expect(template.valid?).to be(false)
    end
  end
  describe "#body" do
    it "is not valid when blank" do
      template = build(:email_template, body: '')
      expect(template.valid?).to be(false)
    end
  end

  describe "#preview" do
    it "renders based on param examples" do
      template = create(:email_template, body: 'Hello {{user_name}}')
      param = build(:email_template_parameter, email_template: template, name: 'user_name', example: 'World')
      template.email_template_parameters << param
      expect(template.preview).to eq('Hello World')
    end
    it "reports syntax errors" do
      template = create(:email_template, body: 'Hello {{user_name')
      param = build(:email_template_parameter, email_template: template, name: 'user_name', example: 'World')
      template.email_template_parameters << param
      expect(template.preview).to eq('ERROR: Liquid syntax error: Variable \'{{\' was not properly terminated with regexp: /\\}\\}/')
    end
  end
end
