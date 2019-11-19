require "rails_helper"

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    # These are required when creating the model so you should also have an example for this
    it "should have a password and password_confirmation input" do
      expect(fields).to be_valid
    end

    # These need to match so you should have an example for where they are not the same
    it "should have a password and password_confirmation that match" do
      expect(password).to match(password_confirmation)
    end
    it "should not be valid if password and password_confirmation do not match" do
      expect(password).not_to match(password_confirmation)
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end