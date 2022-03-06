require "rails_helper"

RSpec.describe "Devs", type: :system do
  it "can switch modes", js: true do
    visit root_path

    expect(page).to have_selector "h1", text: "devfinder"
    expect(page).to have_css(".dark")

    click_on "LIGHT"

    expect(page).not_to have_css(".dark")

    click_on "DARK"

    expect(page).to have_css(".dark")
  end

  it "can return records" do
    visit root_path

    fill_in "search", with: "octocat"

    click_on "Search"

    expect(page).to have_selector "h2", text: "The Octocat"
  end
end
