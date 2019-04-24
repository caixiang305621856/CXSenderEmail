# CXSenderEmail
Fastlane action emailing ruby scripts

# Example
Set your Fastfile
```ruby
import_from_git(url:'https://github.com/caixiang305621856/CXSenderEmail
.git',branch:'master',path:"fastlane/ios_fastfile.rb")
platform :ios do
  desc "sendEmail to others"
  lane :send do
    send_email(
    stmp_server:"smtp.sina.com",
    user_name:"yanyan305621856@sina.com",
    password:"",recipients: ["616704162@qq.com","caix@mail.open.com.cn"],
    subject:"邮件主题",
    message_body:"邮件内容"
    )
  end
 end
```
There are also two other actions that remove remote and local tags and post them to the app to the dandelion
