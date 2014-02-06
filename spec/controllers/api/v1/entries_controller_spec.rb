require 'spec_helper'

describe Api::V1::EntriesController do
  let(:current_user) do
    stub_model User do |user|
      user.id = '5b22da2d-6810-45d5-9689-26061149ca9e'
      user.provider = 'github'
      user.uid = '1'
      user.name = 'Eric Berry'
      user.avatar_url = 'https://2.gravatar.com/avatar/469f88e0c2d6e73916b567f389987301?d=https%3A%2F%2Fidenticons.github.com%2F705a254246ff6850de83ad6a8e461c0a.png&r=x&s=140'
      user.email = 'cavneb@gmail.com'
    end
  end

  before :each do
    controller.stub(:current_user).and_return(current_user)
  end

  describe "POST create" do
    it "creates an entry" do
      post :create, { entry: { url: 'http://jsfiddle.net/cavneb/XbDEM/3/' } }
      json = JSON.parse(response.body)
      entry = json['entry']
      entry['id'].should be_present
      entry['user_id'].should == current_user.id
      entry['edit_link'].should == 'http://jsfiddle.net/cavneb/XbDEM/3/'
      entry['share_link'].should == 'http://jsfiddle.net/cavneb/XbDEM/3/embedded/result/'
      entry['embed_url'].should == 'http://jsfiddle.net/cavneb/XbDEM/3/embedded/result/'
    end
  end
end
