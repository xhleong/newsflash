require 'rails_helper'

RSpec.describe Source, type: :model do

  context "validation: " do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end

end
