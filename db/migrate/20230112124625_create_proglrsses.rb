class CreateProglrsses < ActiveRecord::Migration[6.1]
  def change
    create_table :proglrsses do |t|

      t.timestamps
    end
  end
end
