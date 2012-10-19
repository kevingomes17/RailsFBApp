class CreateFbConnections < ActiveRecord::Migration
  def change
    create_table :fb_connections do |t|
      t.string :user_fbid
      t.string :friend_fbid

      t.timestamps
    end
  end
end
