require 'spec_helper'

describe Request do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @request = user.requests.build(content: "Lorem ipsum") }

  subject { @request }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @request.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank content" do
  	before { @request.content = " " }
  	it { should_not be_valid }
  end

  describe "with content that is too long" do
  	before { @request.content = "a" * 141 }
  	it { should_not be_valid }
  end
end
