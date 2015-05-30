class AddProceedToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :proceed, :boolean, :default => false
  end
end
