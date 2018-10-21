class CreateEmailTemplateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :email_template_parameters do |t|
      t.string :name
      t.string :description
      t.string :example
      t.references :email_template, foreign_key: true

      t.timestamps
    end
  end
end
