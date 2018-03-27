require 'rails_helper'

RSpec.describe User, type: :model do
  let(:positive_name)      {'Xin'}
  let(:positive_email)     {'Xin@123.com'}
  let(:positive_password)  {'123'}

  let(:user)                {User.create(name: positive_name, email: positive_email, password: positive_password)}


  context "validation: " do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it "should validate uniqueness of email" do
      user
      x = User.new(name: abc, email: valid_email, password: valid_password)
      expect{x.save}.to be_false
    end
    it { is_expected.to have_secure_password}
  end

end
