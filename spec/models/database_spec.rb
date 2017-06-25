require 'rails_helper'

RSpec.describe Database, type: :model do

  it { should validate_presence_of(:db_name) }

  it { should validate_presence_of(:db_owner) }

  it { should_not allow_value('  bazza', ' baza').for(:db_name) }

end
