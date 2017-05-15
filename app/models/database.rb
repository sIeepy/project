class Database < ApplicationRecord
  validates :db_name, presence: true, format: { without: /\s/ }
  validates :db_owner, presence: true, format: { without: /\s/ }
end
