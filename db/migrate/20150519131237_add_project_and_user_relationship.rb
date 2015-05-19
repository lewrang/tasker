class AddProjectAndUserRelationship < ActiveRecord::Migration
  def change
    add_reference :tickets, :project, index: true, foreign_key: true
    add_reference :tickets, :user, index: true, foreign_key: true
  end
end
