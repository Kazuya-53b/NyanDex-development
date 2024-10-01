class ChangeDefaultProfileImageInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :profile_image, 'https://nyandexapp-images.s3.ap-northeast-1.amazonaws.com/sample01.jpg'
  end
end
