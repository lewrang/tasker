require 'rails_helper'

feature 'projects' do
    before :each do
      @project1 = create(:project)
      @project2 = create(:project)
      @user = create(:user)
  end
  
  describe 'user_visit_projects_page', type: :feature do
    it 'user see list of projects' do
      visit projects_path
      expect(page).to have_content('Log In')
      
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => "password"
      click_button 'Log in'
      
      visit projects_path
      expect(page).to have_content('Projects')
      expect(page).to have_content(@project1.name)
      expect(page).to have_content(@project2.name)
    end

  end
end