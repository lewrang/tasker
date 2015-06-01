require "rails_helper"

describe Project  do
  it { should validate_presence_of(:name) }
  it { should have_many(:tickets) } 
  
  before :each do
    @project1 = create(:project)
    @project2 = create(:project)
    @project3 = create(:project)
  end
  
  describe "previous project" do
    it "returns previous project if current project is not first" do
      expect(@project1.previous_project).to eq nil
      
      expect(@project2.previous_project.id).to eq @project1.id
      expect(@project2.previous_project.name).to eq @project1.name
      
      expect(@project3.previous_project.id).to eq @project2.id
      expect(@project3.previous_project.name).to eq @project2.name
    end
  end 
  describe "next project" do
    it "returns next project if current project is not last" do
      expect(@project1.next_project.id).to eq @project2.id
      expect(@project1.next_project.name).to eq @project2.name
      
      expect(@project2.next_project.id).to eq @project3.id
      expect(@project2.next_project.name).to eq @project3.name
      
      expect(@project3.next_project).to eq nil
    end
  end
end