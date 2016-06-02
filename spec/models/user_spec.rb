require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  it { is_expected.to allow_value("Steve Jobs").for(:name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
    let(:user_with_downcased_name) { User.create(name: "steve jobs", email: "user@bloccit.com", password: '123123123')}

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid email due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should be an invalid user name due to downcased letters" do
      expect(user_with_downcased_name).to be_valid
    end

    it "capitalizes an invalid entry" do
#      user_with_downcased_name.save
      expect(user_with_downcased_name.name).to eq('Steve Jobs')
    end
  end
end
