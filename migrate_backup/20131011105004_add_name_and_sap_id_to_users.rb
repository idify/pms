class AddNameAndSapIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sap_id, :string
  end
end
