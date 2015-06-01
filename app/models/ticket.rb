class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, :description, :priority, :project_id, presence: true
  attr_accessor :remove_file

  before_save :delete_file, if: ->{ remove_file == '1' && !file_updated_at_changed? }
  before_save :delete_proceed, if: ->{ user_id_changed? }

  
  has_attached_file :file, :styles => lambda { |file| !file.instance.image? ? {} : {:medium => "300x300>", :small => "80x80#"} }, :url  => "/assets/tickets/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/tickets/:id/:style/:basename.:extension"

  validates_attachment_size :file, :less_than => 5.megabytes
  validates_attachment_content_type :file, :content_type => ['image/jpg','image/jpeg','image/png','image/x-png','image/gif','application/msword', 'applicationvnd.ms-word', 'applicaiton/vnd.openxmlformats-officedocument.wordprocessingm1.document', "application/vnd.ms-excel","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,'application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation"]
  
  def previous_ticket
    Ticket.where(["id < ?", id]).last
  end

  def next_ticket
    Ticket.where(["id > ?", id]).first
  end
  
  def delete_proceed
    self.proceed = 'f'
  end
  
  def delete_file
    self.file = nil
    self.file_name = nil
  end  
  def image?
    file.content_type.include? "image"
  end
  
  
end
