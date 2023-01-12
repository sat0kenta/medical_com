class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      
    t.integer :user_id, null: false
    t.string :title, null: false
    t.text :body, null: false
    t.string :ope
    t.string :drug
    t.string :progress

      t.timestamps
    end
  end
end
