Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user, public_repo"

  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], { scope: 'email', client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt' }}}
end
