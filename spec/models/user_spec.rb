require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should have_secure_password }

  it { should validate_length_of(:password).is_at_least(6) }

  it { should validate_length_of(:name).is_at_most(50) }

  it { should_not allow_value('hubertwp.pl', 'hubert@wp,pl', 'hubert@wp.123','hubert@wp@pl').for(:email) }
end


  #
  #
  # # let(:user) { create(:user, email: ')}
  #
  #   it 'is not valid when email is not unique' do
  #
  #     User.create!(name: "hubert", email: "hubert@wp.pl", password: "123456")
  #     expect(subject).to_not be_valid
  #   end
  #
  #   it 'authenticated? shoud be equal false when remember_digist is nil' do
  #     subject.remember_digest = nil
  #     expect(subject.authenticated?('')).to eq false
  #   end
# end
