EasyAuth.config do |c|
  c.o_auth1_client :linked_in, ENV['OAUTH_LINKEDIN_CLIENT_ID'], ENV['OAUTH_LINKEDIN_SECRET']
end
