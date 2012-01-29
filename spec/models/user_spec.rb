# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should have < 50 characters" do
    long_name = "a" * 51
    long_user = User.new(@attr.merge(:name => long_name))
    long_user.should_not be_valid
  end
     
  
  it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
  end
  
  it 'should accept valid emails' do 
    addresses = %w{ ben@me.com USER@foo.monkey.org adc@foo.jp }
    addresses.each do |address|
      valid_email = User.new(@attr.merge(:email => address))
      valid_email.should be_valid
    end
  end
  
  it 'should reject invalid emails' do 
    addresses = %w{ user@foo,com user_at_foo.org example.user@foo. }
    addresses.each do |address|
      valid_email = User.new(@attr.merge(:email => address))
      valid_email.should_not be_valid
    end
  end  
  
  it 'should reject duplicate emails' do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    duplicate_user = User.new(@attr)
    duplicate_user.should_not be_valid
  end
  
  
    
end