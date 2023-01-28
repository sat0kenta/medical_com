class CreateClinicalComments < ActiveRecord::Migration[6.1]
  def change
    create_table :clinical_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :clinical_id
      t.timestamps
    end
  end
end
