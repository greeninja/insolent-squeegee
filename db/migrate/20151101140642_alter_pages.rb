class AlterPages < ActiveRecord::Migration
  def change
  	change_column("pages", "permalink", :string, :limit => 100)
  end
end
