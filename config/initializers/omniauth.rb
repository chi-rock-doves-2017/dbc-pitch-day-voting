# Configuration for OmniAuth middleware, passes OmniAuth
# the client ID and client secret of the github OAuth app

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "repo,read:org,user"
end
