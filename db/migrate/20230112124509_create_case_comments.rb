class CreateCaseComments < ActiveRecord::Migration[6.1]
  def change
    create_table :case_comments do |t|
      
     t.integer :user_id, null: false
     t.integer :case_id, null: false
     t.text :comment, null: false

      t.timestamps
    end
  end
end
