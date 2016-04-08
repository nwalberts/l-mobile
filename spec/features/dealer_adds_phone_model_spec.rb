require 'rails_helper'


feature "dealer adds new phone model" do
  let!(:fake_os) { OperatingSystem.create(name: "Linusxyuntoows") }

  scenario "dealer adds phone models" do
    visit phones_path
    fill_in "Manufacturer", with: "fake_os"
    fill_in "Screen Size", with: "5 inches"
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: "usb"
    fill_in "Model", with: "Business Model"
    fill_in "Quantity", with: 100
    click_on "Submit"

    expect(page.current_path).to eq phones_path
    expect(page).to have_content fake_os.name
    expect(page).to have_content "usb"

    expect(page).to have_content "Phone Added!"
  end

  scenario "dealer does not provide manufacturer" do
    visit phones_path

    fill_in "Screen Size", with: "5 inches"
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: "usb"
    fill_in "Model", with: "Business Model"
    fill_in "Quantity", with: 1
    click_on "Submit"
    save_and_open_page

    expect(page.current_path).to eq phones_path
    expect(page).to_not have_content "Business Model"
    expect(page).to_not have_content "usb"

    expect(page).to have_content "Phone Added...NOT!!!"
  end
end
