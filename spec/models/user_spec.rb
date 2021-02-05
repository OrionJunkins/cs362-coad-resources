require 'rails_helper'
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
RSpec.describe User, type: :model do
  let (:user) do
    build(:user)
  end

  describe 'attributes:' do
    it 'has a role' do
      expect(user).to respond_to(:role)
    end
  
    it 'has an email' do
      expect(user).to respond_to(:email)
    end

  end

  describe 'validation behavior:' do
    it { should validate_presence_of(:email) } 
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:email).case_insensitive } #TODO email format
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create) }

    it 'is invalid without a correctly formatted email' do
      # Use a factory to create a new user
      # Check invalid with invalid email, add good email, check valid
    end

  end

  describe 'associations:' do

    it 'belongs to an organization' do
      should belong_to(:organization).optional
    end

  end

  describe 'behavior:' do 
    it 'has a string representation of its email' do
      expect(user.to_s).to eq(user.email)
    end

    it 'has a role that defaults to organization' do 
      expect(user.role).to eq("organization")
    end

    it 'does not let set_default reassign role if one exists' do 
      user.role = 'admin'
      expect(user.role).to eq("admin")
      user.set_default_role
      expect(user.role).to eq("admin")
    end
  end

end
