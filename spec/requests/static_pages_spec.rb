require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "works! (now write some real specs)" do
      visit '/static_pages/home'
      page.should have_content("Sample Ruby Application")
      page.should have_css("title", text: "Sample Ruby Application")
    end
  end
end
