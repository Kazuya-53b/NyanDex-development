class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :profile_image, :string, default: 'https://nyandexapp-images.s3.ap-northeast-1.amazonaws.com/sample01.jpg'
      t.string :crypted_password

      t.timestamps
    end
  end
end
