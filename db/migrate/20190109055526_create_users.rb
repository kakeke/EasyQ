class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :image
      t.string :user_image_id
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :profile
      t.datetime :last_login_at
      t.datetime :deleted_at
      t.boolean :admin, default: "false"
      
      t.timestamps
    end
  end
end
