class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :timestamps, :integer
  end
end
