require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  
  
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                          :content => "Ruby on Rails Twitter Clone | Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should be successful" do
      get 'contact'
      response.should have_selector("title",
                          :content => "Ruby on Rails Twitter Clone | Contact")
    end
  end
  
  describe 'Get "about"' do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should be successful" do
      get 'about'
      response.should have_selector("title",
                          :content => "Ruby on Rails Twitter Clone | About")
    end
  end
  

end
