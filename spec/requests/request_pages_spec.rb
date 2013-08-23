require 'spec_helper'

describe "Request pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "request creation" do
  	before { visit root_path }

  	describe "with invalid information" do

  		it "should not create a request" do
  			expect { click_button "Post" }.not_to change(Request, :count)
  		end

  		describe "error messages" do
  			before { click_button "Post" }
  			it { should have_content('be blank') }
  		end
  	end

  	describe "with valid information" do

  		before { fill_in 'request_content', with: "Lorem ipsum" }
  		it "should create a request" do
  			expect { click_button "Post" }.to change(Request, :count).by(1)
  		end
  	end
  end

  describe "request destruction" do
    before { FactoryGirl.create(:request, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link 'delete' }.to change(Request, :count).by(-1)
      end
    end
  end
end
