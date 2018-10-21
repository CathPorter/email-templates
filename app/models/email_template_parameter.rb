class EmailTemplateParameter < ApplicationRecord
  belongs_to :email_template

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :example, presence: true
end
