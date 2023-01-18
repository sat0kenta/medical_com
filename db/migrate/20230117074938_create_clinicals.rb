class CreateClinicals < ActiveRecord::Migration[6.1]
  def change
    create_table :clinicals do |t|

    t.integer :user_id, null: false
    t.string :title, null: false
    t.text :body, null: false
    t.text :ope
    t.text :drug
    t.text :progress

      t.timestamps
    end
  end
end
