class CreateCatImages < ActiveRecord::Migration[7.2]
  def change
    create_table :cat_images do |t|
      t.references :cat, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
