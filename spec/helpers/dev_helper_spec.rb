require "rails_helper"

RSpec.describe DevHelper, type: :helper do
  describe "#display_name" do
    it "returns the name when present" do
      dev = Dev.new({ "login" => "oct", "name" => "octocat" })

      expect(display_name(dev)).to eq "octocat"
    end

    it "returns the login when name absent" do
      dev = Dev.new({ "login" => "oct" })

      expect(display_name(dev)).to eq "oct"
    end
  end
end
