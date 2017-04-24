class Table
  include ActiveModel::Model
  attr_accessor :table_name, :row_1, :row_2, :row_3, :row_4, :row_5, :row_6,
                :row_7, :row_8, :row_9, :row_10, :data_1, :data_2, :data_3,
                :data_4, :data_5, :data_6, :data_7, :data_8, :data_9, :data_10

  validates :table_name, presence: true
end
