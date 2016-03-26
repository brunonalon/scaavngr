OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '678960605577796', 'a3eba95c569c9392b9e790c88bd030b0', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
