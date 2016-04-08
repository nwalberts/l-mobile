require 'rails_helper'

feature "dealer adds Phone OS" do
  let(:fake_os) { "Linusxyuntoows" }

  scenario "dealer adds phone os" do
    visit root_path

    fill_in "Name", with: fake_os
    click_on "Submit"

    expect(page.current_path).to eq operating_systems_path
    expect(page).to have_content fake_os
    expect(page).to have_content "Great Success!"

  end

  scenario "dealer does not provide name" do
    visit root_path

    fill_in "Name", with: "    "
    click_on "Submit"

    expect(page.current_path).to eq operating_systems_path
    expect(page).to_not have_css "li"
    expect(page).to have_content "Epic Fail!"
  end
end
