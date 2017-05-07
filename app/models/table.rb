class Table
  include ActiveModel::Model
  attr_accessor :table_name, :row, :data, :index
  
  validates :table_name, presence: true
end
