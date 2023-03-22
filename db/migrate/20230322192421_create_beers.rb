class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :ibu
      t.integer :abv
      t.boolean :fermentation_completed
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
