class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :partners
      t.text :highlights
      t.integer :user_id

      t.timestamps
    end
  end
end
