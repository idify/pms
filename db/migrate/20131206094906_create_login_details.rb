class CreateLoginDetails < ActiveRecord::Migration
  def change
    create_table :login_details do |t|
      t.references :project
      t.string :user_name
      t.string :password
      t.string :git_url
      t.string :description
      t.timestamps
    end
  end
end
