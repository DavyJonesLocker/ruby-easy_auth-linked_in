require 'spec_helper'

vcr_opts = { :cassette_name => 'linkedin_oauth' }

feature 'LinkedIn OAuth Authentication' do

  scenario 'sign_in redirects to the LinkedIn OAuth url' do
    visit root_path

    # Since rack-test won't handle external redirects, we check for exception
    expect {
      click_link 'LinkedIn'
    }.to raise_error(
      ActionController::RoutingError,
      'No route matches [GET] "/uas/oauth2/authorization"'
    )
  end

  scenario 'callback handles oauth2 response', :vcr => vcr_opts, :js => true do
    visit oauth2_callback_path(
      :provider => :linked_in, :code => 'test-auth-code')

    current_path.should eq dashboard_path
    page.source.should have_content('test@example.com')
  end

end
