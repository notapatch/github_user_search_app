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

  describe "clear_mention" do
    it "removes mention when present" do
      dev = Dev.new({ "company" => "@company" })

      expect(clear_mention(dev.company)).to eq "company"
    end

    it "unchanged when mention after prefix" do
      dev = Dev.new({ "company" => "c@mpany" })

      expect(clear_mention(dev.company)).to eq "c@mpany"
    end

    it "unchanged when mention not present" do
      dev = Dev.new({ "company" => "company" })

      expect(clear_mention(dev.company)).to eq "company"
    end
  end
end
