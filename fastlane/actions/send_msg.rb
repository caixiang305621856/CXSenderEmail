require 'net/smtp'
module Fastlane
  module Actions
    module SharedValues
      SEND_MSG_CUSTOM_VALUE = :SEND_MSG_CUSTOM_VALUE
    end
    
    class SendMsgAction < Action
            def self.send_emails(stmpserver_address,sender_address,password,recipients,subject,message_body)
            recipients.each do |recipient_address|
            message_header = ''
            message_header << "From: <#{sender_address}>\r\n"
            message_header << "To: <#{recipient_address}>\r\n"
            message_header << "Subject: #{subject}\r\n"
            message_header << 'Date: ' + Time.now.to_s + "\r\n"
            message_header << 'MIME-Version: 1.0' + "\r\n"
            message_header << 'Content-type: text/html;charset=utf-8' + "\r\n"
            message_header << 'X-Priority:3;X-MSMail-Priority:Normal;X-Mailer:Microsoft Outlook Express 6.00.2900.2869;X-MimeOLE:Produced By Microsoft MimeOLE V6.00.2900.2869;ReturnReceipt:1' + "\r\n"
            message = message_header + "\r\n" + message_body.encode('utf-8') + "\r\n"
            Net::SMTP.start(stmpserver_address, 25, 'yeah.net', sender_address, password, :plain) do |smtp|
             begin
             smtp.send_message(message, sender_address, recipient_address)
              UI.message "📱接收者📱: #{recipient_address}"
               rescue
                 raise Exception => e
                 print 'Exception occured: ' + e
                 end
              end
            end
        end
      def self.run(params)
        send_emails(
        params[:stmp_server],
        params[:user_name],
        params[:password],
        params[:recipients],
        params[:subject],
        params[:message_body]
        )
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "sender msg you want"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "fastlane发邮件的脚本"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
        FastlaneCore::ConfigItem.new(key: :stmp_server,
                                     description: '服务器地址',
                                     optional: false,
                                     type: String),
        FastlaneCore::ConfigItem.new(key: :user_name,
                                     description: '用户名',
                                     optional: false,
                                     type: String),
        FastlaneCore::ConfigItem.new(key: :password,
                                     description: '密码',
                                     optional: false,
                                     type: String),
        FastlaneCore::ConfigItem.new(key: :recipients,
                                     description: '收件人',
                                     optional: false,
                                     type: Array),
        FastlaneCore::ConfigItem.new(key: :subject,
                                     description: '邮件主题',
                                     optional: true,
                                     type: String),
        FastlaneCore::ConfigItem.new(key: :message_body,
                                     description: '邮件内容',
                                     optional: true,
                                     type: String)
        ]
      end

      def self.output
      ["人在江湖，生不由己"]
      end

      def self.return_value
      end

      def self.authors
        ["CaiXiang"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
