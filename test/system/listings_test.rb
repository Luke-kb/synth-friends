require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Brand", with: @listing.brand_id
    fill_in "Category", with: @listing.category_id
    fill_in "End date", with: @listing.end_date
    fill_in "Long description", with: @listing.long_description
    fill_in "Price", with: @listing.price
    fill_in "Short description", with: @listing.short_description
    fill_in "Start date", with: @listing.start_date
    fill_in "Title", with: @listing.title
    fill_in "Year of manufacture", with: @listing.year_of_manufacture
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @listing.brand_id
    fill_in "Category", with: @listing.category_id
    fill_in "End date", with: @listing.end_date
    fill_in "Long description", with: @listing.long_description
    fill_in "Price", with: @listing.price
    fill_in "Short description", with: @listing.short_description
    fill_in "Start date", with: @listing.start_date
    fill_in "Title", with: @listing.title
    fill_in "Year of manufacture", with: @listing.year_of_manufacture
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
