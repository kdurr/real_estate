class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.text :description

      t.timestamps
    end
  end
end
