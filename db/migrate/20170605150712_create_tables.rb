class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
