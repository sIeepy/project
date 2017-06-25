require 'rails_helper'

describe UsersController, 'creating new user', type: :controller do
#  let(:user) {build(:user)}
  it do
    params = { user: attributes_for(:user) }
    should permit(:name, :email, :password).for(:create, params: params)
  end

  describe 'GET #show' do
    before { get :show }

    it { should redirect_to(posts_path) }
    it { should redirect_to(action: :index) }
  end
end
