class CreateCats < ActiveRecord::Migration[7.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :breed
      t.string :color
      t.string :pattern
      t.text :short_description
      t.text :long_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
