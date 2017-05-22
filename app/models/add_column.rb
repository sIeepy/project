class AddColumn
  include ActiveModel::Model
  attr_accessor :row, :data, :required, :unique, :primary_key, :size
end
