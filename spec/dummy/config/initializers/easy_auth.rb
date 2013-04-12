EasyAuth.config do |c|
  c.oauth2_client :linked_in, ENV['OAUTH_LINKEDIN_CLIENT_ID'], ENV['OAUTH_LINKEDIN_SECRET']
end
