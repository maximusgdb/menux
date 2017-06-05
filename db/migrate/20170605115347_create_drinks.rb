class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :size
      t.references :category, foreign_key: true
      t.boolean :favorite
      t.string :picture
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
