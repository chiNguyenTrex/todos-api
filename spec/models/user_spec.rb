require 'rails_helper'

RSpec.describe User, type: :model do
  describe "db columns" do
    it{should have_db_column(:name).of_type :string}
    it{should have_db_column(:email).of_type :string}
    it{should have_db_column(:password_digest).of_type :string}
  end

  describe "relationship" do
    it{should have_many(:todos).dependent :destroy }
  end

  describe "validates" do
    it{should have_secure_password}
    it{should validate_presence_of :name}
    it{should validate_presence_of :email}
    it{should validate_presence_of :password_digest}
  end
end
