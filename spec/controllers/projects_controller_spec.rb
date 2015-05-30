require "rails_helper"

describe ProjectsController do
  before :each do
    @project1 = create(:project)
    @project2 = create(:project)
    @request.env["desive.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end
  describe 'index' do
    it 'return home page' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:projects).length).to eq 2
    end
  end
  
  describe 'show' do
    it 'return show page' do
      get :show, {id: @project1.to_param}
      
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).to eq @project1
    end
  end
  
  describe 'new' do
    it 'return a new article' do
      get :new
      
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).not_to eq nil
    end
  end
  
  describe 'destroy' do
    it 'destroys last article' do
      sign_in FactoryGirl.create(:admin)
      expect(Project.count).to eq 2
      get :destroy, {id: @project2.to_param}
      
      expect(response).to have_http_status(:redirect)
      expect(Project.count).to eq 1
    end
  end 
end