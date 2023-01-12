class CreateFavoritesCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites_counts do |t|
      
      t.integer :case_id, null: false
      t.integer :user_id
      t.string :favorites_weekly
      t.string :favorites_total

      t.timestamps
    end
  end
end
