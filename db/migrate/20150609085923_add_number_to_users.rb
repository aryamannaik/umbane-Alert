class AddNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phonenum, :string
  end
end
