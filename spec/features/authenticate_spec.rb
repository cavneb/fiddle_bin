require 'spec_helper'

describe 'Authenticate', js: true, type: :request do
  it 'should authenticate with Github' do
    login_with_oauth
    expect(page.evaluate_script('Ember.ENV.user.name')).to eq('Test User')
    expect(page.evaluate_script('Ember.ENV.user.email')).to eq('testuser@example.com')
  end
end
