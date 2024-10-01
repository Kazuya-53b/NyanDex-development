class RemoveDefaultProfileImageFromUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :profile_image, from: 'https://nyandexapp-images.s3.ap-northeast-1.amazonaws.com/sample01.jpg', to: nil
  end
end
