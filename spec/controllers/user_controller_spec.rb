require 'rails_helper'

describe UsersController, 'creating new user', type: :controller do
  it do
    params = { user: attributes_for(:user) }
    should permit(:name, :email, :password).for(:create, params: params)
  end

  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:logged_in_user).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #new" do
    subject { get :new }

    it "assigns a new user" do
      is_expected.to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: user
      assigns(:user).should eq(user)
    end

    it "renders the #show view" do
      get :show, id: user
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new contact" do
        expect{ post :create, user: attributes_for(:user)
        }.to change(User,:count).by(0)
      end

      it "redirects to the new contact" do
        post :create, id: user, user: attributes_for(:user)
        response.should redirect_to user.id
      end
    end

    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User,:count)
      end

      it "re-renders the new method" do
        post :create, user: attributes_for(:invalid_user)
        response.should render_template :new
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params }

    context "valid attributes" do
      let(:params) { { id: user.id, user: attributes_for(:user, name: "hubi", email: "huber@wp.pl") } }

      it "changes @user's attributes" do
        subject
        user.reload
        user.name.should eq("hubi")
        user.email.should eq("huber@wp.pl")
      end

      it "redirects to the updated user" do
        subject
        response.should redirect_to user
      end
    end

    it "does not change @contact's attributes" do
      put :update, id: user,
      user: attributes_for(:user, firstname: "hubi", lastname: nil)
      user.reload
      user.name.should eq("hubert")
      user.email.should eq("hubert@wp.pl")
    end

    it "re-renders the edit method" do
      put :update, id: user, user: attributes_for(:invalid_user)
      response.should render_template :edit
    end
  end
end
