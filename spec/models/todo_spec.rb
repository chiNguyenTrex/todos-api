require "rails_helper"

RSpec.describe Todo, type: :model do
  describe "columns" do
    it{should have_db_column(:name).of_type :string}
  end

  describe "validates" do
    it{should validate_presence_of :name}
  end

  describe "relationships" do
    it{is_expected.to have_many(:items).dependent :destroy}
  end
end
