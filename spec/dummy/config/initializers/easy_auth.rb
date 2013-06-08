EasyAuth.config do |c|
  c.oauth2_client :linked_in, ENV['LINKEDIN_API_KEY'], ENV['LINKEDIN_SECRET_KEY']
end
