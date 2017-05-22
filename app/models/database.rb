class Database < ApplicationRecord
  validates :db_name, presence: true, format: { without: /\s/ }, uniqueness: {case_sensitive: false}
  validates :db_owner, presence: true, format: { without: /\s/ }
end
