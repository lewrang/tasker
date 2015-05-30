class AddAttachmentFileToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :tickets, :file
  end
end
