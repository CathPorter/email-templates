class CreateEmailTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
