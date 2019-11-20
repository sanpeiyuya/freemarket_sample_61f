require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    it 'can_save' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

end
