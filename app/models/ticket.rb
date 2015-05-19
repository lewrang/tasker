class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, :description, :priority, presence: true
  has_many :attachments, :dependent => :destroy
end
