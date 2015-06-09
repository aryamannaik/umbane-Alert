class AddAreanumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :areacode, :string
  end
end
