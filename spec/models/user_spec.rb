require "rails_helper"

describe User  do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:tickets) } 

  
  before :each do
    @user = create(:user)
  end
  
  describe "full name" do
    it "returns user full name" do
      expect(@user.full_name).to eq "#{@user.first_name} #{@user.last_name}"
    end
  end 
end