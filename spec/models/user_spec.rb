require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password")}

#name tests
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_length_of(:name).is_at_least(1)}

#email tests
  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_uniqueness_of(:email)}
  it {is_expected.to validate_length_of(:email).is_at_least(3)}
  it {is_expected.to allow_value("user@bloccit.com").for (:email)}
#  it {is_expected.to_not allow_value("user@bloccit.com").for (:email)}
#password tests
  it {is_expected.to validate_presence_of(:password)}
  it {is_expected.to have_secure_password}
  it {is_expected.to validate_length_of(:password).is_at_least(6)}

#attribute tests
  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) {User.new(name: "", email: "user@bloccit.com")}
    let(:user_with_invalid_email) {User.new(name: "Bloccit User", email: "")}

    it "should be an invalid user due because he has no name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user because he has no email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

  describe "user name capitalization" do
    it "should capitalize bobby" do
      user1= User.new(name: "bobby Jones", email: "bjones@bloccit.com", password: "bobbypassword")
      user1.save!
      expect(user1.name).to eq("Bobby Jones")
    end

    it "should capitalize Johannson" do
      user2 = User.new(name: "johannson da magnificant", email: "awesomedude@bloccit.com", password: "tooawesomeforschool")
      user2.save!
      expect(user2.name).to eq("Johannson Da Magnificant")
    end

    it "should leave Steve be" do
      user3 = User.new(name: "Steve Cook", email: "steve@bloccit.com", password: "1234567890")
      user3.save!
      expect(user3.name).to eq("Steve Cook")
    end
  end
end
