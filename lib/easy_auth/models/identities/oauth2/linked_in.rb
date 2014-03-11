module EasyAuth::Models::Identities::Oauth2::LinkedIn
  def account_attributes_map
    {:email => 'emailAddress', :first_name => 'firstName', :last_name => 'lastName'}
  end

  def authorize_url
    "https://www.linkedin.com/uas/oauth2/authorization?state=#{Time.now.to_i}"
  end

  def oauth2_scope
    'r_basicprofile r_emailaddress'
  end

  def account_attributes_url
    '/v1/people/~:(firstName,lastName,emailAddress)?format=json'
  end

  def token_url
    'https://www.linkedin.com/uas/oauth2/accessToken'
  end

  def token_params
    { :mode => :query, :param_name => :oauth2_access_token }
  end

  def site_url
    'https://api.linkedin.com/v1'
  end

  def retrieve_uid(account_attributes)
    account_attributes['emailAddress']
  end
end
