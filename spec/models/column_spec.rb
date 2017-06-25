require 'rails_helper'

RSpec.describe Column, type: :model do

  it { should validate_presence_of(:row) }

end
