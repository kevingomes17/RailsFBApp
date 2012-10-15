class CreateFbUsers < ActiveRecord::Migration
  def change
    create_table :fb_users do |t|
      t.string :name
      t.string :fbid
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
