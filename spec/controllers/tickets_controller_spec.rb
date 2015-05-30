require "rails_helper"

describe TicketsController do
  before :each do
    @ticket1 = create(:ticket)
    @ticket2 = create(:ticket)
    @request.env["desive.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end
  describe 'index' do
    it 'return home page' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:tickets).length).to eq 2
    end
  end
  
  describe 'show' do
    it 'return show page' do
      get :show, {id: @ticket1.to_param}
      
      expect(response).to have_http_status(:success)
      expect(assigns(:ticket)).to eq @ticket1
    end
  end
  
  describe 'new' do
    it 'return a new article' do
      get :new
      
      expect(response).to have_http_status(:success)
      expect(assigns(:ticket)).not_to eq nil
    end
  end
  
  describe 'destroy' do
    it 'destroys last article' do
      sign_in FactoryGirl.create(:admin)
      expect(Ticket.count).to eq 2
      get :destroy, {id: @ticket2.to_param}
      
      expect(response).to have_http_status(:redirect)
      expect(Ticket.count).to eq 1
    end
  end 
end