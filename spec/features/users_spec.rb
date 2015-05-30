require 'rails_helper'

feature 'users' do
    before :each do
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:admin)
  end
  
  describe 'user_visit_users_page', type: :feature do
    it 'user see list of users' do
      visit users_path
      expect(page).to have_content('Log In')
      
      fill_in 'user[email]', :with => @user1.email
      fill_in 'user[password]', :with => "password"
      click_button 'Log in'
      
      visit users_path
      expect(page).to have_content('Users')
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user2.email)
    end

  end
end