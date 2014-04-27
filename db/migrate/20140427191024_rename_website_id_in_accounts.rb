class RenameWebsiteIdInAccounts < ActiveRecord::Migration
  def self.up
  	remove_column :accounts, :website_id
  	add_column :accounts, :website_name, :string
  end

  def self.down
  	add_column :accounts, :website_id, :integer
  	remove_column :accounts, :website_name
  end
end
