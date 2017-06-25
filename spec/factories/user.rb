FactoryGirl.define do
  factory :user do
    name 'hubert'
    email 'hubert@wp.pl'
    password '123456'
  end

  factory :invalid_user, parent: :user do
    name nil
  end

end
