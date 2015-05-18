class Ticket < ActiveRecord::Base
  belongs_to :project
  validates :title, :description, :priority, presence: true
  has_many :attachments, :dependent => :destroy
end
