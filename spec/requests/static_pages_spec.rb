require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content('Devotionally') }
		it { should have_title(full_title('')) } 
		it { should_not have_title('| Home') }
  end

  describe "Contact page" do
  	before { visit contact_path }

		it { should have_content('Contact Us') }
		it { should have_title(full_title('Contact us')) }
  end
end
