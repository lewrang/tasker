require "rails_helper"

describe UsersController do
  before :each do
    @request.env["desive.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @user1 = create(:user)
    @user2 = create(:user)
  end
  describe 'index' do
    it 'return home page' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:users).length).to eq 3
    end
  end
  
  describe 'show' do
    it 'return show page' do
      get :show, {id: @user1.to_param}
      
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq @user1
    end
  end
  
  describe 'new' do
    it 'return a new article' do
      get :new
      
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).not_to eq nil
    end
  end
  
  describe 'destroy' do
    it 'destroys last article' do
      sign_in FactoryGirl.create(:admin)
      expect(User.count).to eq 4
      get :destroy, {id: @user2.to_param}
      
      expect(response).to have_http_status(:redirect)
      expect(User.count).to eq 3
    end
  end 
end