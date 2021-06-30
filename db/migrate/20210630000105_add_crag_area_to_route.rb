class AddCragAreaToRoute < ActiveRecord::Migration[6.1]
  def change
    add_column :routes, :crag, :string
    add_column :routes, :area, :string
  end
end
