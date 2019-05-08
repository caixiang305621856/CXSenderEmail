
default_platform :ios

platform :ios do
  desc 'Lane compilations'
  #发邮件
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

  #删除远程标签 本地标签
  lane :remove_tag do |options|
      tagName = options[:tag]
      remove_tag(
               tag:tagName
               )
  end

  error do |lane, exception|
    UI.message(exception.message)
  end
  
end
