class RemoveAreanumFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :areacode, :integer
  end
end
