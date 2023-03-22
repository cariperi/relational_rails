class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.integer :tanks
      t.boolean :has_license

      t.timestamps
    end
  end
end
