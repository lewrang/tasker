class AddFilenameToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :file_name, :string
  end
end
