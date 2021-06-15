class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.date :date
      t.integer :route_id
      t.string :grade
      t.string :result
      t.boolean :in_progress
      t.decimal :rating
      t.string :partner
      t.text :comments
      t.integer :collection_id
      t.integer :user_id

      t.timestamps
    end
  end
end
