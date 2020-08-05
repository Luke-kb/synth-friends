require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "creating a Loan" do
    visit loans_url
    click_on "New Loan"

    fill_in "End date", with: @loan.end_date
    fill_in "Listing", with: @loan.listing_id
    fill_in "Start date", with: @loan.start_date
    fill_in "Total cost", with: @loan.total_cost
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "updating a Loan" do
    visit loans_url
    click_on "Edit", match: :first

    fill_in "End date", with: @loan.end_date
    fill_in "Listing", with: @loan.listing_id
    fill_in "Start date", with: @loan.start_date
    fill_in "Total cost", with: @loan.total_cost
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan" do
    visit loans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan was successfully destroyed"
  end
end
