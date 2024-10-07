class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats, charset: "utf8mb4", collate: "utf8mb4_0900_ai_ci" do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :breed
      t.string :color
      t.string :pattern
      t.text :short_description
      t.text :long_description
      t.references :user, null: false, foreign_key: true
      t.json :images

      t.timestamps
    end
  end
end
