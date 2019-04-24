
default_platform :ios

platform :ios do
  desc '发送邮件'
  lane :send_email do |options|
      stmp_server = options[:stmp_server]
      user_name = options[:user_name]
      password = options[:password]
      recipients = options[:recipients]
      subject = options[:subject]
      message_body = options[:message_body]
      send_msg(
               stmp_server: stmp_server,
               user_name:user_name,
               password:password,
               recipients: recipients,
               subject:subject,
               message_body:message_body
               )
  end

  error do |lane, exception|
    UI.message(exception.message)
  end
  
end
