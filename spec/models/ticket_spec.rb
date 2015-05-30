require "rails_helper"
include ActionDispatch::TestProcess
describe Ticket  do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:priority) }
  
  before :each do
    @ticket1 = create(:ticket)
    @ticket2 = create(:ticket)
    @ticket3 = create(:ticket)
    @file1 = fixture_file_upload('test1.doc', 'application/ms-word')
    @file2 = fixture_file_upload('test2.xls', 'application/vnd.ms-excel')
    @file3 = fixture_file_upload('test3.jpg', 'img/jpeg')
    @file4 = fixture_file_upload('test4.pdf', 'application/pdf')
    @file5 = fixture_file_upload('test5.ppt', 'application/vnd.ms-powerpoint')
  end
  
  describe "previous ticket" do
    it "returns previous ticket if current ticket is not first" do
      expect(@ticket1.previous_ticket).to eq nil
      
      expect(@ticket2.previous_ticket.id).to eq @ticket1.id
      expect(@ticket2.previous_ticket.title).to eq @ticket1.title
      
      expect(@ticket3.previous_ticket.id).to eq @ticket2.id
      expect(@ticket3.previous_ticket.title).to eq @ticket2.title
    end
  end 
  describe "next ticket" do
    it "returns next ticket if current ticket is not last" do
      expect(@ticket1.next_ticket.id).to eq @ticket2.id
      expect(@ticket1.next_ticket.title).to eq @ticket2.title
      
      expect(@ticket2.next_ticket.id).to eq @ticket3.id
      expect(@ticket2.next_ticket.title).to eq @ticket3.title
      
      expect(@ticket3.next_ticket).to eq nil
    end
  end
  describe "upload files" do
    it "uploads files with content type: jpeg, doc, xls" do
      @ticket1.file = @file1
      @ticket1.save
      expect(@ticket1.file_file_name).to eq @file1.original_filename
      
      @ticket1.file = @file2
      @ticket1.save
      expect(@ticket1.file_file_name).to eq @file2.original_filename
      
      @ticket1.file = @file3
      @ticket1.save
      expect(@ticket1.file_file_name).to eq @file3.original_filename
      
      @ticket1.file = @file4
      @ticket1.save
      expect(@ticket1.file_file_name).to eq @file4.original_filename
      
      @ticket1.file = @file5
      @ticket1.save
      expect(@ticket1.file_file_name).to eq @file5.original_filename
    end
  end 
  
  
  
  
end
