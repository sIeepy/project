FactoryGirl.define do
  factory :database do
    db_name 'baza'
    db_owner 'hubert'
  end

  factory :invalid_database, parent: :database do
    db_name nil
  end
end
