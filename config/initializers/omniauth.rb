OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '655498167848316', 'aa5293d55934d3432f89aa0e21b8e291'
end

#app_id: 655498167848316
#secret: aa5293d55934d3432f89aa0e21b8e291

