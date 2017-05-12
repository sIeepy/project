class Database < ApplicationRecord
  validates :Database_name, presence: true, format: { without: /\s/ }
  validates :Database_owner, presence: true, format: { without: /\s/ }
end
