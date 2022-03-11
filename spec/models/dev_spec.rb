require "rails_helper"

RSpec.describe Dev, type: :model do
  describe "#validation" do
    it "is not valid without login" do
      dev = described_class.new

      dev.valid?

      expect(dev).not_to be_valid
    end

    it "is valid with login" do
      dev = described_class.new({ "login" => "octocat" })

      dev.valid?

      expect(dev).to be_valid
    end
  end
end
