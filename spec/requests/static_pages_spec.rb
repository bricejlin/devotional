require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Devotionally"}

	describe "Home page" do
		it "should have the content 'Devotionally'" do
      visit '/static_pages/home'
      expect(page).to have_content('Devotionally')
    end

    it "should have title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title("#{base_title}")
    end

    it "should not have a custom page title" do
    	visit '/static_pages/home'
    	expect(page).not_to have_title('| Home')
    end
  end

  describe "Contact page" do
  	it "should have the content 'Contact Us'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact Us')
  	end

  	it "should have title 'Contact Us'" do
  		visit '/static_pages/contact'
  		expect(page).to have_title("#{base_title} | Contact Us")
  	end
  end
end
