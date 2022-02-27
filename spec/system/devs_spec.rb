require "rails_helper"

RSpec.describe "Devs", type: :system do
  it "displays dev data" do
    visit root_path

    expect(page).to have_selector "h1", text: "devfinder"
  end
end
