require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { brand_id: @listing.brand_id, category_id: @listing.category_id, end_date: @listing.end_date, long_description: @listing.long_description, price: @listing.price, short_description: @listing.short_description, start_date: @listing.start_date, title: @listing.title, year_of_manufacture: @listing.year_of_manufacture } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { brand_id: @listing.brand_id, category_id: @listing.category_id, end_date: @listing.end_date, long_description: @listing.long_description, price: @listing.price, short_description: @listing.short_description, start_date: @listing.start_date, title: @listing.title, year_of_manufacture: @listing.year_of_manufacture } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
