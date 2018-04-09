require "rails_helper"

RSpec.describe Item, type: :model do
  describe "columns" do
    it{should have_db_column(:name).of_type :string}
    it{should have_db_column(:done).of_type :boolean}
  end

  describe "validates" do
    it{should validate_presence_of :name}
  end

  describe "relationships" do
    it{is_expected.to belong_to(:todo)}
  end
end
