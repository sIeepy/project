class Table
  include ActiveModel::Model
  attr_accessor :table_name, :row, :data, :required, :unique, :primary_key, :size
  validates :table_name, presence: true, format: { without: /\s/ }
end
