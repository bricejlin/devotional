require 'spec_helper'

describe "Static pages" do

	describe "Home page" do
		it "should have the content 'Devotionally'" do
      visit '/static_pages/home'
      expect(page).to have_content('Devotionally')
    end

    it "should have title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title("Devotionally | Home")
    end
  end

  describe "Contact page" do
  	it "should have the content 'Contact Us'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact Us')
  	end

  	it "should have title 'Contact Us'" do
  		visit '/static_pages/contact'
  		expect(page).to have_title("Devotionally | Contact Us")
  	end
  end
end
