require 'spec_helper'

feature 'LinkedIn OAuth Authentication', :js do
  use_vcr_cassette 'linkedin_oauth', :match_requests_on => [:uri], :decode_compressed_response => true

  scenario 'LinkedIn link redirects to the LinkedIn OAuth url' do
    visit root_path

    click_link 'LinkedIn'
    current_url.should match /^https:\/\/www\.linkedin\.com\/uas\/oauth/
  end

  scenario 'Handling a LinkedIn callback' do
    visit oauth_callback_path(:provider => :linked_in, :oauth_token => 'test-auth-code')

    current_path.should eq dashboard_path
    page.should have_content '123456789'
  end
end
