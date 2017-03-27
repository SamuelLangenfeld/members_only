class RemoveMemberFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :member, :boolean
  end
end
