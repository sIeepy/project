class Column
  include ActiveModel::Model
  attr_accessor :table_name, :row, :data, :required, :unique, :primary_key,
                :size
  validates :row, presence: true
end
