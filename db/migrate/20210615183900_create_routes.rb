class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :location
      t.string :mp_url
      t.string :grade
      t.decimal :lat
      t.decimal :lon

      t.timestamps
    end
  end
end
