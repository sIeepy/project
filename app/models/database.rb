class Database < ApplicationRecord
  validates :db_name, presence: true, format: { without: /\s/ }
  validates_uniqueness_of :db_name, scope: :db_owner
  validates :db_owner, presence: true, format: { without: /\s/ }
end
