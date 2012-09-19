require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample Ruby Application'" do
      visit '/static_pages/home'
      page.should have_content("Sample Ruby Application")
      page.should have_css("title", text: "Sample Ruby Application")
    end
  end

  describe "Help Page" do
    it "should help the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content("Help")
    end
  end
end
