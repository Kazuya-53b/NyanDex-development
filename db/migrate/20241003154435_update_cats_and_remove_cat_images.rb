class UpdateCatsAndRemoveCatImages < ActiveRecord::Migration[7.2]
  def change
    # cat_imagesテーブルを削除
    drop_table :cat_images do |t|
      t.bigint :cat_id, null: false
      t.string :image_url
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    # catsテーブルにimagesカラムを追加
    add_column :cats, :images, :json
  end
end
