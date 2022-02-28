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
end
