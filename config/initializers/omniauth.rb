OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '485006518272731', '0de7df118e6ce88b64c9ae2e9e788d20',
      :scope => 'email,user_likes,user_location,user_hometown,user_birthday,user_education_history,user_about_me,user_relationships,user_about_me', :provider_ignores_state => true
end

#app_id: 655498167848316
#secret: aa5293d55934d3432f89aa0e21b8e291