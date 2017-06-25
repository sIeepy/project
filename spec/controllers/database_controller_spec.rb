require 'rails_helper'

describe DatabasesController, 'creating new database', type: :controller do
    let(:database) { create(:database) }
    let(:user) { create(:user) }

  describe "GET #show" do
    it "assigns the requested database to @database" do
      get :show, id: database
      assigns(:database).should eq(database)
    end

    it "renders the #show view" do
      get :show, id: database
      response.should render_template :show
    end
  end
  describe "POST create" do
    context "with valid attributes" do
      subject {current_user}
      it "creates a new database" do
        expect{ post :create, database: attributes_for(:database), user: subject
        }.to change(Database,:count).by(0)
      end

      it "redirects to the new database" do
        post :create, id: database, database: attributes_for(:database)
        response.should redirect_to database.id
      end
    end

    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, database: attributes_for(:invalid_database)
        }.to_not change(Database,:count)
      end

      it "re-renders the new method" do
        post :create, database: attributes_for(:invalid_database)
        response.should render_template :new
      end
    end
  end
end
