require 'spec_helper'

feature 'LinkedIn OAuth Authentication', :js, :vcr do
  scenario 'LinkedIn link redirects to the LinkedIn OAuth url' do
    visit root_path

    click_link 'LinkedIn'
    current_url.should match /^https:\/\/www\.linkedin\.com\/uas\/oauth2/
  end

  scenario 'Handling a LinkedIn callback' do
    visit oauth2_callback_path(:provider => :linked_in, :code => 'test-auth-code')

    current_path.should eq dashboard_path
    page.should have_content 'test@example.com'
  end
end
