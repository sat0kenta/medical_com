class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      
     t.integer :user_id, null: false
     t.integer :case_id

      t.timestamps
    end
  end
end
