class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.decimal :price
      t.string :city
      t.string :category
      t.boolean :available

      t.timestamps
    end
  end
end
