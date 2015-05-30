class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :destroy
  validates :name, presence: true

  def previous_project
    Project.where(["id < ?", id]).last
  end

  def next_project
    Project.where(["id > ?", id]).first
  end
end
