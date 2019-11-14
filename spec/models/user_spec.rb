require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    it 'can_save' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

end

# FactoryBot.define do

#   factory :user do
#     nickname              {"abe"}
#     email                 {"kkk@gmail.com"}
#     password              {"00000000"}
#     password_confirmation {"00000000"}
#   end

# end