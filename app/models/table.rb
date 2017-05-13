class Table
  include ActiveModel::Model
  attr_accessor :table_name, :row, :data, :required, :unique, :primary_key, :lol
  validates :table_name, presence: true, format: { without: /\s/ }
end
