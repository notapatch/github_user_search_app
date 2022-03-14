require "rails_helper"

RSpec.describe "Devs", type: :system do
  it "can switch modes", js: true do
    VCR.use_cassette "can switch modes" do
      visit root_path

      expect(page).to have_selector "h1", text: "devfinder"
      expect(page).to have_css(".dark")

      click_on "LIGHT"

      expect(page).not_to have_css(".dark")

      click_on "DARK"

      expect(page).to have_css(".dark")
    end
  end

  it "shows octocat on startup" do
    VCR.use_cassette "shows octocat on startup" do
      visit root_path

      expect(page).to have_selector "h2", text: "The Octocat"
    end
  end

  it "can return records" do
    VCR.use_cassette "can return records" do
      visit root_path

      fill_in "Search", with: "torvalds"

      click_on "Search"

      expect(page).to have_selector "h2", text: "Linus Torvalds"
    end
  end

  it "shows error and last search results when user unknown" do
    VCR.use_cassette "shows error when user unknown" do
      visit root_path

      fill_in "Search", with: "nobody_on_github"

      click_on "Search"

      expect(page).to have_selector "li", text: "No results"
      expect(page).to have_selector "h2", text: "The Octocat"
    end
  end

  it "shows unauthorized error for bad token" do
    VCR.use_cassette "shows unauthorized error for bad token" do
      allow(ENV).to receive(:[])
      allow(ENV).to receive(:[]).with("AUTHENTICATION_TOKEN").and_return("ghp_012345678901234567890123456789")

      visit root_path

      expect(page).to have_selector "li", text: "Authorization failed"
    end
  end
end
