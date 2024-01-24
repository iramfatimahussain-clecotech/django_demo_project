class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start_date
      t.integer :likes_count
    

      t.timestamps
    end
  end
end
